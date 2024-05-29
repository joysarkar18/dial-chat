import 'package:get/get.dart';

import '../controllers/dialing_controller.dart';

class DialingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialingController>(
      () => DialingController(),
    );
  }
}
