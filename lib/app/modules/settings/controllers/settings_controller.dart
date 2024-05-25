import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  //TODO: Implement SettingsController

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

  void gotoPrivacyScreen() {
    Get.toNamed(Routes.PRIVACY);
  }

  void gotoCallsAndMessageScreen() {
    Get.toNamed(Routes.CALLS_AND_MESSAGE);
  }

  void gotoAboutScreen() {
    Get.toNamed(Routes.ABOUT);
  }

  void gotoAccountScreen() {
    Get.toNamed(Routes.ACCOUNT);
  }

  void gotoNotificationScreen() {
    Get.toNamed(Routes.NOTIFICATION);
  }

  void gotoStorageScreen() {
    Get.toNamed(Routes.STORAGE);
  }

  void gotoLanguageScreen() {
    Get.toNamed(Routes.LANGUAGE);
  }

  void gotoAppThemeScreen() {
    Get.toNamed(Routes.APP_THEME);
  }

  void increment() => count.value++;
}
