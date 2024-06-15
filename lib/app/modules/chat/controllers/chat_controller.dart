import 'package:cloud_firestore/cloud_firestore.dart';
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
    // Initialize the chat reference and stream based on the room ID passed via Get.arguments
    final chatId = Get.arguments[0]["chatID"];
    print("chat id : $chatId");
    print(Get.arguments[0]);
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
    messageController.clear();
  }
}
