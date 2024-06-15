import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dial_chat/app/models/user_model.dart';
import 'package:dial_chat/app/modules/home/controllers/home_controller.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/Dialog_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

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

  void getAvailableUserData() async {
    availableUsers.value = [];
    unavailableContacts.value = [];
    print("get available contact called");
    DialogHelper.showLoading();
    final contacts = await ContactsService.getContacts();
    final userCollection = FirebaseFirestore.instance.collection('users');
    for (Contact ct in contacts) {
      if (ct.phones != null && ct.phones!.isNotEmpty) {
        for (Item phone in ct.phones!) {
          final phoneNo = phone.value!.replaceAll(RegExp(r'\D'), '');
          print(phoneNo);
          final userSnapshot =
              await userCollection.where('phoneNo', isEqualTo: phoneNo).get();

          if (userSnapshot.docs.isNotEmpty) {
            final userData = UserModel.fromJson(userSnapshot.docs.first.data());
            availableUsers
                .add(UserContactModel(userModel: userData, contact: ct));
          } else {
            unavailableContacts.add(ct);
          }
        }
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

  void increment() => count.value++;
}
