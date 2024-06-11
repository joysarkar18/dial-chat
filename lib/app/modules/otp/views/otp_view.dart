import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/modules/phonenumber/controllers/phonenumber_controller.dart';
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
        body: Obx(
      () => Column(
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
                "${Get.find<PhonenumberController>().dialCode.value} ${Get.find<PhonenumberController>().phoneNumberController.text}",
                style: AppTextStyles.rubik12w400(color: context.black),
              ),
            ],
          ),
          InkWell(
            onTap: Get.back,
            child: Text(
              AppStrings.incorrectNumber,
              style: AppTextStyles.rubik12w400(color: context.secondaryBlue),
            ),
          ),
          60.kheightBox,

//  ----------------OTP----------------------------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: PinCodeTextField(
              controller: controller.otpController,
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
              onCompleted: (otp) {
                controller.verifyOtp(otp);
              },
            ),
          ),
          60.kheightBox,
          InkWell(
            onTap: () {
              if (controller.countdown.value <= 0) {
                controller.resendOtp();
              }
            },
            child: Text(
              AppStrings.resendOTP,
              style: AppTextStyles.rubik12w600(
                  color: controller.countdown.value == 0
                      ? context.secondaryBlue
                      : context.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Text(
                  AppStrings.requestNewOTP,
                  style: AppTextStyles.rubik12w400(color: context.black),
                ),
              ),
              Text(
                "0." + controller.countdown.value.toString(),
                style: AppTextStyles.rubik12w400(color: context.black),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
