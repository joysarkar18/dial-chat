import 'package:dial_chat/app/components/check_box.dart';
import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/calls_and_message_controller.dart';

class CallsAndMessageView extends GetView<CallsAndMessageController> {
  const CallsAndMessageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45.kh,
        titleSpacing: 10.kw,
        title: Text(
          AppStrings.callsAndMessages,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.kheightBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.callerID,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    const CustomCheckBox(),
                  ],
                ),
                Text(
                  AppStrings.allowDialChatTo,
                  style: AppTextStyles.inter11w400(color: context.grey),
                ),
              ],
            ),
            12.kheightBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.silenceUnknownCallers,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    const CustomCheckBox(),
                  ],
                ),
                Text(
                  AppStrings.callsFromUnknownCallers,
                  style: AppTextStyles.inter11w400(color: context.grey),
                ),
              ],
            ),
            12.kheightBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.pressEnterToSend,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    const CustomCheckBox(),
                  ],
                ),
                Text(
                  AppStrings.enterKeyWillBeSent,
                  style: AppTextStyles.inter11w400(color: context.grey),
                ),
              ],
            ),
            12.kheightBox,
            Text(
              AppStrings.clearChatHistory,
              style: AppTextStyles.inter14w400(
                color: context.black,
              ),
            ),
            12.kheightBox,
            const Divider(),
            12.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.backUpYourChats,
                        style: AppTextStyles.inter14w400(color: context.black)),
                    Text(AppStrings.backUpYourChatsSubtitle,
                        style: AppTextStyles.inter11w400(color: context.grey)),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30.kh,
                    width: 67.kw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: context.secondaryBlue,
                    ),
                    child: Center(
                      child: Text(
                        AppStrings.backUp,
                        style: AppTextStyles.inter11w600(color: context.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            12.kheightBox,
            Text(
              AppStrings.lastBackUp,
              style: AppTextStyles.inter12w400(color: context.black),
            ),
            Text(
              AppStrings.size,
              style: AppTextStyles.inter12w400(color: context.black),
            ),
            12.kheightBox,
            Text(
              AppStrings.manageStorage,
              style: AppTextStyles.inter12w600(color: context.primaryBlue),
            ),
            14.kheightBox,
            Text(
              AppStrings.googleAccount,
              style: AppTextStyles.inter12w400(color: context.black),
            ),
            Text(
              AppStrings.exampleEmail,
              style: AppTextStyles.inter12w400(color: context.grey),
            ),
            14.kheightBox,
            Text(
              AppStrings.frequency,
              style: AppTextStyles.inter12w400(color: context.black),
            ),
            Text(
              AppStrings.monthly,
              style: AppTextStyles.inter12w400(color: context.grey),
            ),
            14.kheightBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.includeVideos,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    const CustomCheckBox(),
                  ],
                ),
                Text(
                  AppStrings.thisWillIncludeVideos,
                  style: AppTextStyles.inter11w400(color: context.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
