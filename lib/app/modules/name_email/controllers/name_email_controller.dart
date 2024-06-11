import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/components/error_dialog.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class NameEmailController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  RxString pickedImagePath = "".obs;

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedImagePath.value = image.path;
    }
  }

  void uploadDataToFirebase() async {
    print("uploaded called");
    String name = nameController.text.trim();
    String email = emailController.text.trim();

    if (!isValidName(name) || !isValidEmail(email)) {
      errorDialog(message: "Please enter a valid name and email.");
      return;
    }

    showLoadingOverlay();

    String imageUrl = '';
    if (pickedImagePath.value.isNotEmpty) {
      imageUrl = await uploadFile(pickedImagePath.value);
    }

    print("image uploaded");

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'name': name,
        'email': email,
        'imageUrl': imageUrl,
      });
      Get.offAllNamed(Routes.NAV_BAR);
    } catch (e) {
      errorDialog(message: "Failed to upload data. Please try again.");
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<String> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      String fileName = basename(filePath);
      Reference storageRef = FirebaseStorage.instance.ref().child(
          'profile_images/${FirebaseAuth.instance.currentUser!.uid}_$fileName');

      TaskSnapshot uploadTask = await storageRef.putFile(file);
      String downloadUrl = await uploadTask.ref.getDownloadURL();
      print("image uploaded successfully");
      return downloadUrl;
    } catch (e) {
      errorDialog(message: "Something went wrong while uploading the file!");
      print('Error uploading file: $e');
      return "";
    }
  }

  bool isValidName(String name) {
    return name.isNotEmpty;
  }

  bool isValidEmail(String email) {
    return email.isNotEmpty && email.contains('@');
  }

  void showLoadingOverlay() {
    Get.dialog(
      Center(child: CircularProgressIndicator()),
      barrierDismissible: false,
    );
  }

  void hideLoadingOverlay() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
