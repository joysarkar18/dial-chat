import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:get/get.dart';

class AccountController extends GetxController {
  //TODO: Implement AccountController

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

  void gotoSubscriptionScreen() {
    Get.toNamed(Routes.SUBSCRIPTION);
  }

  void gotoChangeNumberScreen() {
    Get.toNamed(Routes.CHANGE_NUMBER);
  }

  void gotoDeleteAccountScreen() {
    Get.toNamed(Routes.DELETE_ACCOUNT);
  }

  void increment() => count.value++;
}
