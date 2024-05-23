import 'package:dial_chat/app/components/check_box.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/storage_controller.dart';

class StorageView extends GetView<StorageController> {
  const StorageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.storage,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.kheightBox,
            const Divider(),
            10.kheightBox,
            Text(
              AppStrings.mediaAutoDownloadSettings,
              style: AppTextStyles.inter14w500(color: context.black),
            ),
            30.kheightBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.autoDownloadMediaOverMobileData,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    const CustomCheckBox(),
                  ],
                ),
                Text(
                  AppStrings.allowAutoDownloadOfPhotosOverMobileData,
                  style: AppTextStyles.inter11w400(color: context.grey),
                ),
              ],
            ),
            10.kheightBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.autoDownloadMediaOverWifi,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    const CustomCheckBox(),
                  ],
                ),
                Text(
                  AppStrings.allowAutoDownloadOfPhotosOverWifi,
                  style: AppTextStyles.inter11w400(color: context.grey),
                ),
              ],
            ),
            10.kheightBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.autoPlayVideos,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    const CustomCheckBox(),
                  ],
                ),
                Text(
                  AppStrings.allowVideosToPlayAutomaticOnceDownloaded,
                  style: AppTextStyles.inter11w400(color: context.grey),
                ),
              ],
            ),
            10.kheightBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.restrictDataUsage,
                      style: AppTextStyles.inter14w400(color: context.black),
                    ),
                    const CustomCheckBox(),
                  ],
                ),
                Text(
                  AppStrings.dialChatWillOptimizeMinimalData,
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
