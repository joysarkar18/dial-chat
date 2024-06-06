import 'package:get/get.dart';

import '../controllers/chat_call_controller.dart';

class ChatCallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatCallController>(
      () => ChatCallController(),
    );
  }
}
