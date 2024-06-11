import 'package:dial_chat/app/modules/app_theme/controllers/app_theme_controller.dart';
import 'package:dial_chat/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  // Initialize the controller
  final AppThemeController appThemeController = Get.put(AppThemeController());

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppThemeController appThemeController =
        Get.find<AppThemeController>();

    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: appThemeController.themeMode.value,
        initialRoute: FirebaseAuth.instance.currentUser != null
            ? Routes.NAV_BAR
            : AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    });
  }
}
