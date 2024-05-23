import 'package:dial_chat/app/components/button.dart';
import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/change_number_controller.dart';

class ChangeNumberView extends GetView<ChangeNumberController> {
  const ChangeNumberView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.changeNumber,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.kheightBox,
            Row(
              children: [
                Text(
                  AppStrings.currentNumber,
                  style: AppTextStyles.inter12w400(color: context.black),
                ),
                4.kwidthBox,
                Text(
                  AppStrings.number,
                  style: AppTextStyles.inter12w400(color: context.black),
                ),
              ],
            ),
            10.kheightBox,
            const Divider(),
            10.kheightBox,
            Text(
              AppStrings.myNewNumberIs,
              style: AppTextStyles.rubik12w400(color: context.black),
            ),
            26.kheightBox,
            SizedBox(
              child: Row(
                children: [
                  Container(
                    width: 56.kw,
                    height: 20.kh,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1.2, color: context.grey))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '+27',
                            hintStyle:
                                AppTextStyles.rubik15w400(color: context.grey)),
                      ),
                    ),
                  ),
                  40.kwidthBox,
                  Expanded(
                    child: Container(
                      height: 20.kh,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1.2, color: context.grey))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '67 307 4029',
                              hintStyle: AppTextStyles.rubik15w400(
                                  color: context.grey)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            90.kheightBox,
            Center(
              child: MyButton(
                text: AppStrings.continueButton,
                bgColor: context.secondaryBlue,
                textColor: context.white,
                height: 50.kh,
                width: 180.kw,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: context.white,
                        title: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            AppStrings.isThisYourCorrectPhoneNumber,
                            style:
                                AppTextStyles.rubik13w600(color: context.black),
                          ),
                        ),
                        content: SizedBox(
                          width: 100.w,
                          height: 200.kh,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  AppStrings.number,
                                  style: AppTextStyles.rubik20w400(
                                      color: context.black),
                                ),
                              ),
                              20.kheightBox,
                              Text(
                                AppStrings.youWillReceivedAnOtpViaCallOrSms,
                                style: AppTextStyles.rubik12w400(
                                    color: context.black),
                              ),
                              20.kheightBox,
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  AppStrings.yes,
                                  style: AppTextStyles.rubik12w400(
                                      color: context.black),
                                ),
                              ),
                              20.kheightBox,
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  AppStrings.edit,
                                  style: AppTextStyles.rubik12w500(
                                      color: context.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
