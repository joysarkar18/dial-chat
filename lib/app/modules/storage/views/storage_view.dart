import 'package:dial_chat/app/components/check_box.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/storage_pb.dart';
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '32',
                  style: AppTextStyles.inter15w500(color: context.black),
                ),
                4.kwidthBox,
                Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
                  child: Text(
                    'MB',
                    style: AppTextStyles.inter10w500(color: context.black),
                  ),
                ),
                const Spacer(),
                Text(
                  '8.9',
                  style: AppTextStyles.inter15w500(color: context.black),
                ),
                4.kwidthBox,
                Padding(
                  padding: const EdgeInsets.only(bottom: 1.0),
                  child: Text(
                    'GB',
                    style: AppTextStyles.inter10w500(color: context.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Used',
                  style: AppTextStyles.inter10w500(color: context.black),
                ),
                Text(
                  'Free',
                  style: AppTextStyles.inter10w500(color: context.black),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: StorageUsage(
                myAppStorageUsage: 0.03, //total 100 gb
                otherAppsStorageUsage: .15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Container(
                    height: 10.kh,
                    width: 10.kw,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: context.secondaryBlue),
                  ),
                  5.kwidthBox,
                  Text(
                    'DialChat (32 MB)',
                    style: AppTextStyles.inter12w400(color: context.black),
                  ),
                  const Spacer(),
                  Container(
                    height: 10.kh,
                    width: 10.kw,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: context.green),
                  ),
                  5.kwidthBox,
                  Text(
                    'Other App (15 GB)',
                    style: AppTextStyles.inter12w400(color: context.black),
                  ),
                ],
              ),
            ),
            10.kheightBox,
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
