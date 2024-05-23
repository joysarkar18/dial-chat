import 'package:dial_chat/app/components/button.dart';
import 'package:dial_chat/app/components/dropdown.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/phonenumber_controller.dart';

class PhonenumberView extends GetView<PhonenumberController> {
  const PhonenumberView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            120.kheightBox,
            Center(
              child: Text(
                AppStrings.enterPhoneNumber,
                style: AppTextStyles.rubik15w600(color: context.black),
              ),
            ),
            24.kheightBox,
            Text(
              AppStrings.loginPageParagraph_1,
              style: AppTextStyles.rubik12w400(color: context.black),
            ),
            Text(
              AppStrings.loginPageParagraph_2,
              style: AppTextStyles.rubik12w400(color: context.black),
            ),
            60.kheightBox,
            const CustomDropdown(),
            60.kheightBox,
            SizedBox(
              width: 250.kw,
              child: Row(
                children: [
                  Container(
                    width: 30.kw,
                    height: 20.kh,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1.2, color: context.grey))),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '+27',
                          hintStyle:
                              AppTextStyles.rubik15w400(color: context.grey)),
                    ),
                  ),
                  40.kwidthBox,
                  Expanded(
                    child: Container(
                      // width: 70.kw,
                      height: 20.kh,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1.2, color: context.grey))),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '67 307 4029',
                            hintStyle:
                                AppTextStyles.rubik15w400(color: context.grey)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            60.kheightBox,
            MyButton(
              text: AppStrings.continueButton,
              bgColor: context.secondaryBlue,
              textColor: context.white,
              height: 50.kh,
              width: 180.kw,
              onTap: controller.gotoOtpScreen,
            )
          ],
        ),
      ),
    );
  }
}
