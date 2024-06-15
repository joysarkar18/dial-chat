import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/components/error_dialog.dart';
import 'package:dial_chat/app/modules/phonenumber/controllers/phonenumber_controller.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameEmailController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  RxString pickedImagePath = "".obs;
  RxString imageUrl = "".obs;

  @override
  void onInit() {
    getUserData();
    super.onInit();
  }

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

    if (pickedImagePath.value.isNotEmpty) {
      imageUrl.value = await uploadFile(pickedImagePath.value);
    }

    print("image uploaded");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("phine No ${prefs.getString("phoneNo")}");
    try {
      print("doint update");
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'name': name,
        'email': email,
        'imageUrl': imageUrl.value,
        'phoneNo': prefs.getString("phoneNo"),
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "online": true,
      });
      print("uploaded data");
      Get.offAllNamed(Routes.NAV_BAR);
    } catch (e) {
      print(e);
      errorDialog(message: "Failed to upload data. Please try again.");
    } finally {
      hideLoadingOverlay();
    }
  }

  void getUserData() async {
    var data = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(data.data());

    if (data.data() != null) {
      emailController.text = data.data()!["email"];
      nameController.text = data.data()!["name"];
      imageUrl.value = data.data()!["imageUrl"];
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
