import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:get/get.dart';

class NameEmailController extends GetxController {
  //TODO: Implement NameEmailController

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

  void gotoNavBar() {
    Get.offAllNamed(Routes.NAV_BAR);
  }

  void increment() => count.value++;
}
