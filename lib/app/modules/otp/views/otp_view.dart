import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: PinCodeTextField(
              appContext: context,
              length: 6,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                activeColor: context.secondaryBlue,
                selectedColor: context.primaryBlue,
                inactiveColor: Colors.grey,
              ),
              animationDuration: Duration(milliseconds: 300),
              enableActiveFill: true,
              beforeTextPaste: (text) {
                // Allow pasting
                return true;
              },
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
              InkWell(
                onTap: controller.gotoNameAndEmailScreen,
                child: Text(
                  AppStrings.requestNewOTP,
                  style: AppTextStyles.rubik12w400(color: context.black),
                ),
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
