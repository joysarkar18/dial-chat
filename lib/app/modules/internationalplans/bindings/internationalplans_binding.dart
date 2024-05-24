import 'package:get/get.dart';

import '../controllers/internationalplans_controller.dart';

class InternationalplansBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternationalplansController>(
      () => InternationalplansController(),
    );
  }
}
