import 'package:get/get.dart';

import '../controllers/localplans_controller.dart';

class LocalplansBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalplansController>(
      () => LocalplansController(),
    );
  }
}
