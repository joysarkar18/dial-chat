import 'package:get/get.dart';

import '../controllers/calls_and_message_controller.dart';

class CallsAndMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CallsAndMessageController>(
      () => CallsAndMessageController(),
    );
  }
}
