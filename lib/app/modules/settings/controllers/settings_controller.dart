import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  //TODO: Implement SettingsController

  final count = 0.obs;
  @override
  void onInit() {
    getuserData();
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

  Map<String, dynamic>? userData;

  RxBool isLoading = true.obs;

  void getuserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      userData = value.data();
      isLoading.value = false;
    });
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
