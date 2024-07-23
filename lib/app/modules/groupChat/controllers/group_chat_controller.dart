import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/models/user_model.dart';
import 'package:dial_chat/app/modules/home/controllers/home_controller.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final messages = <DocumentSnapshot>[].obs;
  final messageController = TextEditingController();

  late CollectionReference chatReference;
  late Stream<QuerySnapshot> chatStream;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getGroupsMenbers();
    final chatId = Get.arguments[0]["chatID"];
    chatReference =
        _firestore.collection('chats').doc(chatId).collection('messages');
    chatStream =
        chatReference.orderBy('timestamp', descending: true).snapshots();
    chatStream.listen((QuerySnapshot snapshot) {
      messages.assignAll(snapshot.docs);
    });
  }

  List menberList = Get.arguments[0]["userIds"];
  Map<String, UserModel> allMemberMap = {};
  getGroupsMenbers() async {
    for (String mem in menberList) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(mem)
          .get()
          .then((value) {
        allMemberMap[mem] = UserModel.fromJson(value.data()!)!;
      });
    }
    isLoading.value = false;
    print(allMemberMap);
  }

  void sendMessage(String text) {
    if (text.isEmpty) return;

    chatReference.add({
      'text': text,
      'senderId': FirebaseAuth.instance.currentUser!.uid,
      'timestamp': FieldValue.serverTimestamp(),
    });
    for (var i in menberList) {
      _firestore
          .collection("users")
          .doc(i)
          .collection("chatRooms")
          .doc(Get.arguments[0]["chatID"])
          .update({
        "lastUpdate": Timestamp.fromDate(DateTime.now()),
        "seen": false,
        "lastMessage": text,
        "chatId": Get.arguments[0]["chatID"],
      });
    }

    messageController.clear();
  }

  void gotoProfilePage({required Map<String, dynamic> data}) {
    Get.toNamed(Routes.PROFILE_GROUP, arguments: {"data": data});
  }
}
