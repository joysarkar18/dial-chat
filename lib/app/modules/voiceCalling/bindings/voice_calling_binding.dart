import 'package:get/get.dart';

import '../controllers/voice_calling_controller.dart';

class VoiceCallingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoiceCallingController>(
      () => VoiceCallingController(),
    );
  }
}
