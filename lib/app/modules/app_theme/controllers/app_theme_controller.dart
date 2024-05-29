import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppThemeController extends GetxController {
  var themeMode = ThemeMode.system.obs;

  void setLightTheme() {
    themeMode.value = ThemeMode.light;
    Get.changeThemeMode(ThemeMode.light);
  }

  void setDarkTheme() {
    themeMode.value = ThemeMode.dark;
    Get.changeThemeMode(ThemeMode.dark);
  }

  void setSystemTheme() {
    themeMode.value = ThemeMode.system;
    Get.changeThemeMode(ThemeMode.system);
  }
}
