import 'package:get/get.dart';

import '../controllers/dial_pad_controller.dart';

class DialPadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialPadController>(
      () => DialPadController(),
    );
  }
}
