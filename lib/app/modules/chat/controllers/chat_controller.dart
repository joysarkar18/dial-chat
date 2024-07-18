import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/modules/home/controllers/home_controller.dart';
import 'package:dial_chat/app/utils/Dialog_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final messages = <DocumentSnapshot>[].obs;
  final messageController = TextEditingController();

  late CollectionReference chatReference;
  late Stream<QuerySnapshot> chatStream;

  @override
  void onInit() {
    super.onInit();
    final chatId = Get.arguments[0]["chatID"];
    chatReference =
        _firestore.collection('chats').doc(chatId).collection('messages');
    chatStream =
        chatReference.orderBy('timestamp', descending: true).snapshots();
    chatStream.listen((QuerySnapshot snapshot) {
      messages.assignAll(snapshot.docs);
    });
  }

  void sendMessage(String text) {
    if (text.isEmpty) return;
    chatReference.add({
      'text': text,
      'senderId': Get.arguments[0]["user"].uid,
      'timestamp': FieldValue.serverTimestamp(),
    });

    _firestore
        .collection("users")
        .doc(Get.arguments[0]["user"].uid)
        .collection("chatRooms")
        .doc(Get.arguments[0]["chatID"])
        .update({
      "user": Get.find<HomeController>().userData,
      "lastUpdate": Timestamp.fromDate(DateTime.now()),
      "seen": false,
      "lastMessage": text,
      "chatId": Get.arguments[0]["chatID"],
    });
    messageController.clear();
  }

  Future<void> sendImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Upload image to storage and get URL
      String imageUrl = await uploadImage(File(pickedFile.path));
      sendMessage(imageUrl);
    }
  }

  Future<void> sendDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // Upload document to storage and get URL
      String documentUrl =
          await uploadDocument(File(result.files.single.path!));
      sendMessage(documentUrl);
    }
  }

  Future<void> sendLocation() async {
    // Position position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    String locationMessage = "dadjsakjdaskd";
    sendMessage(locationMessage);
  }

  Future<void> sendContact() async {
    print("send contact called");
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();
      if (contacts.isNotEmpty) {
        Contact contact = contacts.first;
        String contactDetails =
            'Contact: ${contact.displayName}, ${contact.phones!.isNotEmpty ? contact.phones!.first.value : 'No phone number'}';
        sendMessage(contactDetails);
      }
    } else {
      Get.snackbar("Permission Denied",
          "Contacts permission is required to send contacts");
    }
  }

  Future<String> uploadImage(File file) async {
    DialogHelper.showLoading();
    String fileName =
        'images/${DateTime.now().millisecondsSinceEpoch}images.png';
    TaskSnapshot taskSnapshot =
        await _storage.ref().child(fileName).putFile(file);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    DialogHelper.hideDialog();
    return downloadUrl;
  }

  Future<String> uploadDocument(File file) async {
    DialogHelper.showLoading();
    String fileName =
        'documents/${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';
    TaskSnapshot taskSnapshot =
        await _storage.ref().child(fileName).putFile(file);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    DialogHelper.hideDialog();
    return downloadUrl;
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted) {
      Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? PermissionStatus.denied;
    } else {
      return permission;
    }
  }
}
