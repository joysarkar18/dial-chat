import 'package:dial_chat/app/components/check_box.dart';
import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/components/dialog_box.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/privacy_controller.dart';

class PrivacyView extends GetView<PrivacyController> {
  const PrivacyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.privacy,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.kw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.kheightBox,
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.twoStepVerification,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    Text(
                      AppStrings.createPinCodeToSecureAccount,
                      style: AppTextStyles.inter11w400(color: context.grey),
                    ),
                  ],
                ),
              ),
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
                      AppStrings.profilePhoto,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    const CustomCheckBox(),
                  ],
                ),
                Text(
                  AppStrings.letPeopleSeeYourProfile,
                  style: AppTextStyles.inter11w400(color: context.grey),
                ),
              ],
            ),
            12.kheightBox,
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const MyDialogBox(
                      title: AppStrings.setYourDisapperingMessages,
                      option1: AppStrings.hours24,
                      option2: AppStrings.week,
                      option3: AppStrings.days90,
                      option4: AppStrings.off,
                    );
                  },
                );
              },
              child: SizedBox(
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.disappearingMessage,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    Text(
                      AppStrings.setYourDisapperingMessagesSubTitle,
                      style: AppTextStyles.inter11w400(color: context.grey),
                    ),
                  ],
                ),
              ),
            ),
            12.kheightBox,
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const MyDialogBox(
                      title: AppStrings.whoCanSeeMyPostsStories,
                      option1: AppStrings.everyone,
                      option2: AppStrings.myContacts,
                      option3: AppStrings.myContactsExcept,
                      option4: AppStrings.noOne,
                    );
                  },
                );
              },
              child: SizedBox(
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.myPostsStories,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    Text(
                      AppStrings.setWhoCanSeeMyPostsStories,
                      style: AppTextStyles.inter11w400(color: context.grey),
                    ),
                  ],
                ),
              ),
            ),
            12.kheightBox,
            const Divider(),
            12.kheightBox,
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.blockList,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    Text(
                      AppStrings.blockUnblockYourContacts,
                      style: AppTextStyles.inter11w400(color: context.grey),
                    ),
                  ],
                ),
              ),
            ),
            12.kheightBox,
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 100.w,
                child: Text(
                  AppStrings.privacyPolicy,
                  style: AppTextStyles.inter14w400(color: context.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
