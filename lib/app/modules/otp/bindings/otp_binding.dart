import 'package:dial_chat/app/modules/phonenumber/controllers/phonenumber_controller.dart';
import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(
      () => OtpController(),
    );
  }
}
