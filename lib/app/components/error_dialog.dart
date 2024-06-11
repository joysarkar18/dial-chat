import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void errorDialog({required String message}) {
  Get.dialog(
    AlertDialog(
      title: Text(
        'Error',
        style: AppTextStyles.inter24w500(color: Colors.red.shade500),
      ),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            'OK',
            style: AppTextStyles.inter14w500(color: Colors.cyan),
          ),
        ),
      ],
      backgroundColor: Get.isDarkMode ? Colors.grey[800] : Colors.white,
      titleTextStyle: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
      contentTextStyle: TextStyle(
        color: Get.isDarkMode ? Colors.white : Colors.black,
      ),
    ),
  );
}
