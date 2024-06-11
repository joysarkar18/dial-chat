import 'dart:async';
import 'package:dial_chat/app/components/error_dialog.dart';
import 'package:dial_chat/app/modules/phonenumber/controllers/phonenumber_controller.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  late Timer _timer;
  RxInt countdown = 0.obs;
  RxBool resendEnabled = false.obs;

  PhonenumberController _phonenumberController =
      Get.put(PhonenumberController());

  final count = 0.obs;

  @override
  void onInit() {
    verificationId = _phonenumberController.verificationIdString;
    super.onInit();
    startCountdown();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  void startCountdown() {
    countdown.value = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        countdown.value--;
      } else {
        timer.cancel();
        resendEnabled.value = true;
      }
    });
  }

  void verifyOtp(String otp) async {
    showLoading(); // Show loading overlay
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      Get.offAllNamed(Routes.NAME_EMAIL); // Navigate to home screen after login
    } catch (e) {
      Get.back(); // Dismiss loading overlay
      // Handle errors
      showErrorDialog('Invalid Otp! Enter the correct otp.');
      print("Error: $e");
    }
  }

  void resendOtp() async {
    showLoading(); // Show loading overlay
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber:
            "${_phonenumberController.dialCode.value}${_phonenumberController.phoneNumberController.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          Get.offAllNamed(
              Routes.NAME_EMAIL); // Navigate to home screen after login
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.back(); // Dismiss loading overlay
          // Handle verification failed
          showErrorDialog(e.message ?? 'Verification failed');
        },
        codeSent: (String newVerificationId, int? resendToken) {
          verificationId = newVerificationId;
          startCountdown();
          resendEnabled.value = false;
          Get.back(); // Dismiss loading overlay
        },
        codeAutoRetrievalTimeout: (String newVerificationId) {
          verificationId = newVerificationId;
          Get.back(); // Dismiss loading overlay
        },
      );
    } catch (e) {
      Get.back(); // Dismiss loading overlay
      // Handle errors
      showErrorDialog('Something went wrong!');
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

  TextEditingController otpController = TextEditingController();

  void increment() => count.value++;
}
