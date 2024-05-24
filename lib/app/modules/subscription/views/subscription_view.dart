import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/modules/internationalplans/views/internationalplans_view.dart';
import 'package:dial_chat/app/modules/localplans/views/localplans_view.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/subscription_controller.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  const SubscriptionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 10.kw,
        toolbarHeight: 45.kh,
        title: Text(
          AppStrings.subscriptions,
          style: AppTextStyles.inter14w500(color: context.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.kw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.kheightBox,
              Center(
                child: SizedBox(
                  width: 120.kw,
                  height: 50.kh,
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonImageView(
                            svgPath: AppSvg.appBarChatLogo,
                          ),
                          Text(AppStrings.dialChat,
                              style: AppTextStyles.rubik20w400(
                                  color: context.black)),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Text(
                          AppStrings.voice,
                          style: AppTextStyles.rubik15w400italic(
                              color: context.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              20.kheightBox,
              Container(
                height: 90.kh,
                width: 240.kw,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: context.lightGrey_2),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.walletBalance,
                            style:
                                AppTextStyles.rubik12w400(color: context.black),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              AppStrings.r,
                              style: AppTextStyles.rubik20w400(
                                  color: context.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0, left: 34),
                      child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: 30.kh,
                            width: 80.kw,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: context.secondaryBlue),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    AppStrings.topUp,
                                    style: AppTextStyles.rubik12w400(
                                        color: context.white),
                                  ),
                                  6.kwidthBox,
                                  CommonImageView(
                                    svgPath: AppSvg.upArrow,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              40.kheightBox,
              Obx(() {
                return Row(
                  children: [
                    Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          controller.selectedView(0);
                        },
                        child: Container(
                          height: 40.kh,
                          width: 130.kw,
                          decoration: BoxDecoration(
                              color: controller.selectedView.value == 0
                                  ? context.secondaryBlue
                                  : context.lightGrey_2,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              AppStrings.localPlans,
                              style: AppTextStyles.inter16w400(
                                  color: controller.selectedView.value == 0
                                      ? context.white
                                      : context.secondaryBlue),
                            ),
                          ),
                        ),
                      ),
                    ),
                    16.kwidthBox,
                    Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: () {
                          controller.selectedView(1);
                        },
                        child: Container(
                          height: 40.kh,
                          width: 180.kw,
                          decoration: BoxDecoration(
                              color: controller.selectedView.value == 0
                                  ? context.lightGrey_2
                                  : context.secondaryBlue,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              AppStrings.internationalPlans,
                              style: AppTextStyles.inter16w400(
                                  color: controller.selectedView.value == 0
                                      ? context.secondaryBlue
                                      : context.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
              40.kheightBox,
              Obx(() {
                return controller.selectedView.value == 0
                    ? const LocalplansView()
                    : const InternationalplansView();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
