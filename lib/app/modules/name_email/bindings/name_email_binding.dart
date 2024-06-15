import 'package:dial_chat/app/modules/phonenumber/controllers/phonenumber_controller.dart';
import 'package:get/get.dart';

import '../controllers/name_email_controller.dart';

class NameEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NameEmailController>(
      () => NameEmailController(),
    );
  }
}
