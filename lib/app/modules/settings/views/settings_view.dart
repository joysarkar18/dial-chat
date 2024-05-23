import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.settings,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.kheightBox,
              Center(
                child: Container(
                  height: 70.kh,
                  width: 70.kw,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.lightGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CommonImageView(
                      imagePath: AppSvg.addPhotoCameraIcon,
                    ),
                  ),
                ),
              ),
              15.kheightBox,
              Center(
                child: Text(
                  AppStrings.profileName,
                  style: AppTextStyles.inter14w600(color: context.black),
                ),
              ),
              5.kheightBox,
              Center(
                child: Text(
                  AppStrings.number,
                  style: AppTextStyles.inter12w400(color: context.black),
                ),
              ),
              40.kheightBox,
              Row(
                children: [
                  CommonImageView(
                    svgPath: AppSvg.accountUserAvatar,
                  ),
                  20.kwidthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.account,
                        style: AppTextStyles.inter13w400(color: context.black),
                      ),
                      Text(
                        AppStrings.subsciptionsChangeNumber,
                        style: AppTextStyles.inter12w400(color: context.grey),
                      ),
                    ],
                  )
                ],
              ),
              20.kheightBox,
              InkWell(
                onTap: controller.gotoPrivacyScreen,
                child: Row(
                  children: [
                    CommonImageView(
                      svgPath: AppSvg.lock,
                    ),
                    20.kwidthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.privacy,
                          style:
                              AppTextStyles.inter13w400(color: context.black),
                        ),
                        Text(
                          AppStrings.twoStepVerificationBlokContacts,
                          style: AppTextStyles.inter12w400(color: context.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              20.kheightBox,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: CommonImageView(
                      svgPath: AppSvg.notifications,
                    ),
                  ),
                  20.kwidthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.notifications,
                        style: AppTextStyles.inter13w400(color: context.black),
                      ),
                      Text(
                        AppStrings.ringtonesMessageSound,
                        style: AppTextStyles.inter12w400(color: context.grey),
                      ),
                    ],
                  )
                ],
              ),
              20.kheightBox,
              InkWell(
                onTap: controller.gotoCallsAndMessageScreen,
                child: Row(
                  children: [
                    CommonImageView(
                      svgPath: AppSvg.callsAndMessageIcon,
                    ),
                    20.kwidthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.callsAndMessages,
                          style:
                              AppTextStyles.inter13w400(color: context.black),
                        ),
                        Text(
                          AppStrings.callerIdBackUps,
                          style: AppTextStyles.inter12w400(color: context.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              20.kheightBox,
              Row(
                children: [
                  CommonImageView(
                    svgPath: AppSvg.storageIcon,
                  ),
                  20.kwidthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.storage,
                        style: AppTextStyles.inter13w400(color: context.black),
                      ),
                      Text(
                        AppStrings.dataUsageAutoDownloadSet,
                        style: AppTextStyles.inter12w400(color: context.grey),
                      ),
                    ],
                  )
                ],
              ),
              20.kheightBox,
              Row(
                children: [
                  CommonImageView(
                    svgPath: AppSvg.languageIcon,
                  ),
                  20.kwidthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.language,
                        style: AppTextStyles.inter13w400(color: context.black),
                      ),
                      Text(
                        AppStrings.english,
                        style: AppTextStyles.inter12w400(color: context.grey),
                      ),
                    ],
                  )
                ],
              ),
              20.kheightBox,
              Row(
                children: [
                  CommonImageView(
                    svgPath: AppSvg.appThemeIcon,
                  ),
                  20.kwidthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.appTheme,
                        style: AppTextStyles.inter13w400(color: context.black),
                      ),
                      Text(
                        AppStrings.changeAppAppearance,
                        style: AppTextStyles.inter12w400(color: context.grey),
                      ),
                    ],
                  )
                ],
              ),
              20.kheightBox,
              InkWell(
                onTap: controller.gotoAboutScreen,
                child: Row(
                  children: [
                    CommonImageView(
                      svgPath: AppSvg.aboutIcon,
                    ),
                    20.kwidthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.about,
                          style:
                              AppTextStyles.inter13w400(color: context.black),
                        ),
                        Text(
                          AppStrings.aboutUsSupport,
                          style: AppTextStyles.inter12w400(color: context.grey),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              20.kheightBox,
              Row(
                children: [
                  CommonImageView(
                    svgPath: AppSvg.shareIcon,
                  ),
                  20.kwidthBox,
                  Text(
                    AppStrings.inviteAFriend,
                    style: AppTextStyles.inter13w400(color: context.black),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
