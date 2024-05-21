import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          100.kheightBox,
          Center(
            child: Text(
              AppStrings.verifyingYourNumber,
              style: AppTextStyles.rubik15w600(color: context.black),
            ),
          ),
          30.kheightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.otpSentTo,
                style: AppTextStyles.rubik12w400(color: context.black),
              ),
              Text(
                AppStrings.number,
                style: AppTextStyles.rubik12w400(color: context.black),
              ),
            ],
          ),
          Text(
            AppStrings.incorrectNumber,
            style: AppTextStyles.rubik12w400(color: context.secondaryBlue),
          ),
          60.kheightBox,

//  ----------------OTP----------------------------------------------------
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

// ---------------------------------------------------------------
          60.kheightBox,
          Text(
            AppStrings.resendOTP,
            style: AppTextStyles.rubik12w600(color: context.secondaryBlue),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.requestNewOTP,
                style: AppTextStyles.rubik12w400(color: context.black),
              ),
              Text(
                AppStrings.time,
                style: AppTextStyles.rubik12w400(color: context.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
