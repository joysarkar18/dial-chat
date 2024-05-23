import 'package:dial_chat/app/components/button.dart';
import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/two_step_verification_controller.dart';

class TwoStepVerificationView extends GetView<TwoStepVerificationController> {
  const TwoStepVerificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.twoStepVerification,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: CommonImageView(
              svgPath: AppSvg.plushIcon,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          50.kheightBox,
          Center(
            child: Column(
              children: [
                Text(
                  AppStrings.createAUniquePinThatYouWill,
                  style: AppTextStyles.inter14w500(color: context.black),
                ),
                Text(
                  AppStrings.rememberThisWillBeRequired,
                  style: AppTextStyles.inter14w500(color: context.black),
                ),
                Text(
                  AppStrings.whenRegisteringYourPhone,
                  style: AppTextStyles.inter14w500(color: context.black),
                ),
                Text(
                  AppStrings.numberAgain,
                  style: AppTextStyles.inter14w500(color: context.black),
                ),
              ],
            ),
          ),
          50.kheightBox,
          SizedBox(
            width: 50.w,
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    3,
                    (index) {
                      return Container(
                        height: 22.kh,
                        width: 30.kh,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: context.grey))),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            hintText: '*',
                            hintStyle:
                                TextStyle(color: context.grey, fontSize: 20),
                            counterText: "",
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {},
                        ),
                      );
                    },
                  ),
                ),
                20.kwidthBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    3,
                    (index) {
                      return Container(
                        height: 22.kh,
                        width: 30.kh,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: context.grey))),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          decoration: InputDecoration(
                            hintText: '*',
                            hintStyle:
                                TextStyle(color: context.grey, fontSize: 20),
                            counterText: "",
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {},
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          80.kheightBox,
          MyButton(
              text: AppStrings.continueButton,
              bgColor: context.secondaryBlue,
              textColor: context.white,
              height: 50.kh,
              width: 180.kw,
              onTap: () {})
        ],
      ),
    );
  }
}
