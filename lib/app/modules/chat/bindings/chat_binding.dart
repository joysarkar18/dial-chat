import 'package:dial_chat/app/modules/calls/controllers/calls_controller.dart';
import 'package:dial_chat/app/modules/chatCall/controllers/chat_call_controller.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
