import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:async';

class NotificationController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // Start the periodic timer
  }

  @override
  void onClose() {
    // Cancel the timer when the controller is closed

    super.onClose();
  }

  void increment() => count.value++;
}
