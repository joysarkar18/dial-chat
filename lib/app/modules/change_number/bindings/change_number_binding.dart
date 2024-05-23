import 'package:get/get.dart';

import '../controllers/change_number_controller.dart';

class ChangeNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeNumberController>(
      () => ChangeNumberController(),
    );
  }
}
