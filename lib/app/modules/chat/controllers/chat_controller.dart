import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
}
