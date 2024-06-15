import 'dart:async';
import 'package:dial_chat/app/components/error_dialog.dart';
import 'package:dial_chat/app/modules/phonenumber/controllers/phonenumber_controller.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/Dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;
  late Timer _timer;
  RxInt countdown = 0.obs;
  RxBool resendEnabled = false.obs;

  final PhonenumberController _phonenumberController =
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
    DialogHelper.showLoading(); // Show loading overlay
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
      Get.snackbar("Error", 'Invalid Otp! Enter the correct otp.');
      print("Error: $e");
    }
  }

  void resendOtp() async {
    DialogHelper.showLoading(); // Show loading overlay
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber:
            "${_phonenumberController.dialCode.value}${_phonenumberController.phoneNumberController.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);

          // Obtain shared preferences.

          Get.toNamed(Routes.NAME_EMAIL); // Navigate to home screen after login
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.back(); // Dismiss loading overlay
          // Handle verification failed
          Get.snackbar("Error", "Something went wrong!");
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
      Get.snackbar("Error", "Something went wrong!");
      print("Error: $e");
    }
  }

  TextEditingController otpController = TextEditingController();
}
