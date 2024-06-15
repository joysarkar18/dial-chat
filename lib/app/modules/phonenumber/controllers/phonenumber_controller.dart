import 'package:dial_chat/app/components/error_dialog.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhonenumberController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationIdString = "";

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

  void singupOrLogin() async {
    String phoneNumber = "${dialCode.value}${phoneNumberController.text}";
    showLoading(); // Show loading overlay
    try {
      // Sign in the user with their phone number
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException e) {
          Get.back(); // Dismiss loading overlay
          // Handle verification failed
          showErrorDialog(e.message ?? 'Verification failed');
        },
        codeSent: (String verificationId, int? resendToken) async {
          Get.back(); // Dismiss loading overlay
          // Navigate to OTP screen and pass verificationId to it
          verificationIdString = verificationId;
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString(
            'phoneNo',
            phoneNumberController.text.trim(),
          );
          Get.toNamed(Routes.OTP, arguments: verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      Get.back(); // Dismiss loading overlay
      // Handle errors
      showErrorDialog('Error: $e');
      print("Error: $e");
    }
  }

  void showLoading() {
    Get.dialog(
      Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void showErrorDialog(String message) {
    errorDialog(message: message);
  }

  RxString dialCode = "+91".obs;
  TextEditingController phoneNumberController = TextEditingController();

  void changeDialCode(String value) {
    dialCode.value = value;
  }

  void increment() => count.value++;
}
