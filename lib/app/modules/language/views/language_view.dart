import 'package:dial_chat/app/components/check_box.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  const LanguageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.language,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.kheightBox,
              Text(
                AppStrings.chooseALanguage,
                style: AppTextStyles.inter15w500(color: context.black),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 8.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCheckBox(),
                        8.kwidthBox,
                        Text(
                          AppStrings.systemDefaultEnglish,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        )
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCheckBox(),
                        8.kwidthBox,
                        Text(
                          AppStrings.afrikaans,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        )
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCheckBox(),
                        8.kwidthBox,
                        Text(
                          AppStrings.albanian,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        )
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCheckBox(),
                        8.kwidthBox,
                        Text(
                          AppStrings.cestina,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        )
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCheckBox(),
                        8.kwidthBox,
                        Text(
                          AppStrings.dutch,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        )
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCheckBox(),
                        8.kwidthBox,
                        Text(
                          AppStrings.french,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        )
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCheckBox(),
                        8.kwidthBox,
                        Text(
                          AppStrings.german,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        )
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCheckBox(),
                        8.kwidthBox,
                        Text(
                          AppStrings.greek,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        )
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCheckBox(),
                        8.kwidthBox,
                        Text(
                          AppStrings.hindi,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        )
                      ],
                    ),
                    8.kheightBox,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCheckBox(),
                        8.kwidthBox,
                        Text(
                          AppStrings.indonesian,
                          style:
                              AppTextStyles.inter14w400(color: context.black),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
