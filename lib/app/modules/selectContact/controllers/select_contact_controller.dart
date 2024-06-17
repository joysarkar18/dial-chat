import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dial_chat/app/models/user_model.dart';
import 'package:dial_chat/app/modules/home/controllers/home_controller.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/Dialog_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserContactModel {
  final UserModel userModel;
  final Contact contact;

  UserContactModel({required this.userModel, required this.contact});
}

class SelectContactController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    getAvailableUserData();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  HomeController homeController = Get.find();

  RxList<UserContactModel> availableUsers = <UserContactModel>[].obs;
  RxList<Contact> unavailableContacts = <Contact>[].obs;

  // Add RxString for group logo URL
  RxString groupLogoUrl = ''.obs;

  // Add method to pick an image
  Future<void> pickGroupLogo() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      await uploadGroupLogo(file);
    }
  }

  // Add method to upload image to Firebase Storage
  Future<void> uploadGroupLogo(File file) async {
    final storageRef = FirebaseStorage.instance.ref();
    final groupLogosRef = storageRef
        .child('groupLogos/${DateTime.now().millisecondsSinceEpoch}.jpg');

    try {
      await groupLogosRef.putFile(file);
      final downloadUrl = await groupLogosRef.getDownloadURL();
      groupLogoUrl.value = downloadUrl;
    } catch (e) {
      print('Error uploading group logo: $e');
      Get.snackbar('Error', 'Failed to upload group logo');
    }
  }

  void getAvailableUserData() async {
    availableUsers.value = [];
    unavailableContacts.value = [];
    print("get available contact called");
    DialogHelper.showLoading();
    final contacts = await ContactsService.getContacts();
    final userCollection = FirebaseFirestore.instance.collection('users');

    // Prepare batches of phone numbers to query Firestore
    List<List<String>> phoneBatches = [];
    List<String> currentBatch = [];

    for (Contact ct in contacts) {
      if (ct.phones != null && ct.phones!.isNotEmpty) {
        for (Item phone in ct.phones!) {
          final phoneNo = phone.value!.replaceAll(RegExp(r'\D'), '');
          currentBatch.add(phoneNo);

          // Firestore allows a maximum of 10 'in' clauses per query, adjust batch size if needed
          if (currentBatch.length >= 10) {
            phoneBatches.add([...currentBatch]);
            currentBatch.clear();
          }
        }
      }
    }

    // Add remaining batch
    if (currentBatch.isNotEmpty) {
      phoneBatches.add([...currentBatch]);
    }

    // Execute batch queries
    for (List<String> batch in phoneBatches) {
      QuerySnapshot batchSnapshot =
          await userCollection.where('phoneNo', whereIn: batch).get();

      // Process batch results
      for (QueryDocumentSnapshot doc in batchSnapshot.docs) {
        final userData = UserModel.fromJson(doc.data() as Map<String, dynamic>);
        final phoneNo = doc[
            'phoneNo']; // Assuming 'phoneNo' is a field in your Firestore document
        // Find corresponding contact
        Contact? matchingContact = contacts.firstWhereOrNull((ct) => ct.phones!
            .any((phone) =>
                phone.value!.replaceAll(RegExp(r'\D'), '') == phoneNo));

        if (matchingContact != null) {
          availableUsers.add(
              UserContactModel(userModel: userData, contact: matchingContact));
        }
      }
    }

    // Identify unavailable contacts
    for (Contact ct in contacts) {
      if (!availableUsers.any(
          (userContact) => userContact.contact.identifier == ct.identifier)) {
        unavailableContacts.add(ct);
      }
    }

    print(availableUsers.value);
    print(unavailableContacts);
    DialogHelper.hideDialog();
  }

  void startChat({required UserModel user, required String name}) async {
    String chatId = await createOrGetChatRoom(
        FirebaseAuth.instance.currentUser!.uid, user.uid);

    Get.toNamed(Routes.CHAT, arguments: [
      {"name": name, "user": user, "chatID": chatId}
    ]);
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createOrGetChatRoom(String userId, String otherUserId) async {
    final chatRoomsCollection = _firestore.collection('chatRooms');

    // Check if a chat room already exists with both user IDs
    QuerySnapshot userChatRoomsSnapshot =
        await chatRoomsCollection.where('userIds', arrayContains: userId).get();

    for (var doc in userChatRoomsSnapshot.docs) {
      List<dynamic> userIds = doc['userIds'];
      if (userIds.contains(otherUserId) && userIds.length == 2) {
        // Chat room exists
        return doc.id;
      }
    }

    // Create a new chat room
    DocumentReference chatRoomDoc = await chatRoomsCollection.add({
      'userIds': [userId, otherUserId],
      'createdAt': FieldValue.serverTimestamp(),
    });

    // Update both users' chat rooms
    final userChatRooms =
        _firestore.collection('users').doc(userId).collection('chatRooms');
    final otherUserChatRooms =
        _firestore.collection('users').doc(otherUserId).collection('chatRooms');

    await userChatRooms
        .doc(chatRoomDoc.id)
        .set({'createdAt': FieldValue.serverTimestamp()});
    await otherUserChatRooms
        .doc(chatRoomDoc.id)
        .set({'createdAt': FieldValue.serverTimestamp()});

    return chatRoomDoc.id;
  }

  // Function to create a chat group with multiple users
  Future<String> createChatGroup(
      {required String groupName,
      required List<UserModel> users,
      required String adminId}) async {
    final chatRoomsCollection = _firestore.collection('chatRooms');

    // Get user IDs from the list of UserModel
    List<String> userIds = users.map((user) => user.uid).toList();
    userIds.add(adminId); // Add admin ID to the user list

    // Create a new chat group
    DocumentReference chatRoomDoc = await chatRoomsCollection.add({
      'userIds': userIds,
      'groupName': groupName,
      'adminId': adminId,
      'createdAt': FieldValue.serverTimestamp(),
      'isGroupChat': true,
      'groupLogoUrl': groupLogoUrl.value, // Add group logo URL
    });

    // Update each user's chat rooms
    for (String userId in userIds) {
      final userChatRooms =
          _firestore.collection('users').doc(userId).collection('chatRooms');
      await userChatRooms.doc(chatRoomDoc.id).set({
        'userIds': userIds,
        'groupName': groupName,
        'adminId': adminId,
        'createdAt': FieldValue.serverTimestamp(),
        'isGroupChat': true,
        'groupLogoUrl': groupLogoUrl.value,
        "user": Get.find<HomeController>().userData,
        "lastUpdate": Timestamp.fromDate(DateTime.now()),
        "seen": false,
        "lastMessage": "",
        "chatId": chatRoomDoc.id,
      });
    }

    return chatRoomDoc.id;
  }

  void increment() => count.value++;
}
