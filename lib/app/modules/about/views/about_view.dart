import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Row(
          children: [
            CommonImageView(
              svgPath: AppSvg.backArrow,
            ),
            5.kwidthBox,
            Text(
              AppStrings.about,
              style: AppTextStyles.inter14w500(color: context.black),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
            height: 60.kh,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonImageView(
                  svgPath: AppSvg.appBarChatLogo,
                  height: 60.kh,
                  width: 60.kw,
                ),
                Text(AppStrings.dialChat,
                    style: AppTextStyles.rubik28w400(color: context.black))
              ],
            ),
          ),
          26.kheightBox,
          Text(
            AppStrings.appVersion,
            style: AppTextStyles.inter14w600(color: context.black),
          ),
          10.kheightBox,
          Text(
            AppStrings.support,
            style: AppTextStyles.inter14w500(color: context.secondaryBlue),
          ),
          20.kheightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImageView(
                imagePath: AppSvg.facebookLogo,
                height: 30.kh,
                width: 30.kw,
              ),
              20.kwidthBox,
              CommonImageView(
                imagePath: AppSvg.titterLogo,
                height: 30.kh,
                width: 30.kw,
              ),
            ],
          ),
          const Spacer(),
          Text(
            AppStrings.termsOfUse,
            style: AppTextStyles.inter14w400(color: context.secondaryBlue),
          ),
          4.kheightBox,
          Text(
            AppStrings.privacyPolicy,
            style: AppTextStyles.inter14w400(color: context.secondaryBlue),
          ),
          50.kheightBox,
        ],
      ),
    );
  }
}
