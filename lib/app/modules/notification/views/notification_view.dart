import 'package:dial_chat/app/components/check_box.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.notifications,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.kheightBox,
            Text(
              AppStrings.notificationSound,
              style: AppTextStyles.inter14w400(color: context.black),
            ),
            Text(
              AppStrings.defaultSpaceline,
              style: AppTextStyles.inter11w400(color: context.grey),
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
                      AppStrings.vibrateWhenRinging,
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
          ],
        ),
      ),
    );
  }
}
