import 'package:dial_chat/app/components/button.dart';
import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.secondaryBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonImageView(
            svgPath: AppSvg.appLogo,
          ),
          SizedBox(
            height: 30.kh,
          ),
          Text(
            AppStrings.welcomeMessage,
            style: AppTextStyles.rubik24w400(color: context.white),
          ),
          SizedBox(
            height: 30.kh,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Read our ',
                style: AppTextStyles.rubik11w400(color: context.white),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Privacy Policy',
                  style: AppTextStyles.rubik11w400(color: context.primaryBlue),
                ),
              ),
              Text(
                '. Tap Accept and Continue to',
                style: AppTextStyles.rubik11w400(color: context.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'accept the ',
                style: AppTextStyles.rubik11w400(color: context.white),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Terms of Service.',
                  style: AppTextStyles.rubik11w400(color: context.primaryBlue),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 14.kh,
          ),
          Center(
            child: MyButton(
                text: 'Accept and Continue',
                bgColor: context.white,
                textColor: context.secondaryBlue,
                width: 60.w,
                height: 50.kh,
                onTap: controller.gotoLoginScreen),
          )
        ],
      ),
    );
  }
}
