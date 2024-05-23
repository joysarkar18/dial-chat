import 'package:get/get.dart';

import '../controllers/app_theme_controller.dart';

class AppThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppThemeController>(
      () => AppThemeController(),
    );
  }
}
