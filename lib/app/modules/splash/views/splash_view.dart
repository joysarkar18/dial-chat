import 'package:dial_chat/app/components/button.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppSvg.appLogo,
            semanticsLabel: 'App Logo',
            height: 130.kh,
            width: 130.kh,
          ),
          SizedBox(
            height: 30.kh,
          ),
          Text(
            AppStrings.welcomeMessage,
            style: AppTextStyles.uiRegBody(color: AppColors.white),
          ),
          SizedBox(
            height: 30.kh,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Read our ',
                style: AppTextStyles.termsText(color: AppColors.white),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Privacy Policy',
                  style: AppTextStyles.termsText(color: AppColors.primaryBlue),
                ),
              ),
              Text(
                '. Tap Accept and Continue to',
                style: AppTextStyles.termsText(color: AppColors.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'accept the ',
                style: AppTextStyles.termsText(color: AppColors.white),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Terms of Service.',
                  style: AppTextStyles.termsText(color: AppColors.primaryBlue),
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
                bgColor: AppColors.white,
                textColor: AppColors.secondaryBlue,
                width: 60.w,
                height: 50.kh,
                onTap: () {}),
          )
        ],
      ),
    );
  }
}
