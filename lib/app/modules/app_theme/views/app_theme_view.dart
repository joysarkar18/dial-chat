import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/app_theme_controller.dart';

class AppThemeView extends GetView<AppThemeController> {
  const AppThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.appTheme,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.kheightBox,
            Text(
              AppStrings.chooseATheme,
              style: AppTextStyles.inter15w500(color: context.black),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 8.0),
              child: Obx(() {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio<ThemeMode>(
                          value: ThemeMode.system,
                          fillColor:
                              MaterialStatePropertyAll(context.secondaryBlue),
                          groupValue: controller.themeMode.value,
                          onChanged: (ThemeMode? value) {
                            if (value != null) {
                              controller.setSystemTheme();
                            }
                          },
                        ),
                        8.kwidthBox,
                        Text(
                          AppStrings.systemDefault,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        ),
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio<ThemeMode>(
                          value: ThemeMode.light,
                          groupValue: controller.themeMode.value,
                          fillColor:
                              MaterialStatePropertyAll(context.secondaryBlue),
                          onChanged: (ThemeMode? value) {
                            if (value != null) {
                              controller.setLightTheme();
                            }
                          },
                        ),
                        8.kwidthBox,
                        Text(
                          AppStrings.light,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        ),
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio<ThemeMode>(
                          value: ThemeMode.dark,
                          fillColor:
                              MaterialStatePropertyAll(context.secondaryBlue),
                          groupValue: controller.themeMode.value,
                          onChanged: (ThemeMode? value) {
                            if (value != null) {
                              controller.setDarkTheme();
                            }
                          },
                        ),
                        8.kwidthBox,
                        Text(
                          AppStrings.dark,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
