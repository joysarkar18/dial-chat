import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void gotoNameAndEmailScreen() {
    Get.toNamed(Routes.NAME_EMAIL);
  }

  void increment() => count.value++;
}
