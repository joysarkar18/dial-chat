import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/calls_controller.dart';

class CallsView extends GetView<CallsController> {
  const CallsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.kw),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.recentCalls,
                  style:
                      AppTextStyles.inter15w500(color: context.lightTextBlack),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.viewAll,
                      style: AppTextStyles.inter12w500(
                          color: context.secondaryBlue),
                    ))
              ],
            ),
            10.kheightBox,
            ...[1, 2, 3, 4].map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.kh),
                        child: CommonImageView(
                          height: 50.kh,
                          width: 50.kh,
                          fit: BoxFit.cover,
                          url:
                              "https://variety.com/wp-content/uploads/2024/02/Eminem.jpg",
                        ),
                      ),
                      20.kwidthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Greg Beast",
                            style:
                                AppTextStyles.inter14w600(color: context.black),
                          ),
                          3.kheightBox,
                          Text(
                            "Outgoing",
                            style:
                                AppTextStyles.inter12w300(color: context.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: context.grey),
                            child: Center(
                              child: CommonImageView(
                                svgPath: AppSvg.callIcon,
                                height: 24,
                                svgColor: context.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Row(
              children: [
                Text(
                  AppStrings.contacts,
                  style:
                      AppTextStyles.inter15w500(color: context.lightTextBlack),
                ),
              ],
            ),
            16.kheightBox,
            ...[1, 2, 3, 4].map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.kh),
                        child: CommonImageView(
                          height: 50.kh,
                          width: 50.kh,
                          fit: BoxFit.cover,
                          url:
                              "https://variety.com/wp-content/uploads/2024/02/Eminem.jpg",
                        ),
                      ),
                      20.kwidthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Greg Beast",
                            style:
                                AppTextStyles.inter14w600(color: context.black),
                          ),
                          3.kheightBox,
                          Text(
                            "Outgoing",
                            style:
                                AppTextStyles.inter12w300(color: context.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: context.grey),
                            child: Center(
                              child: CommonImageView(
                                svgPath: AppSvg.callIcon,
                                height: 24,
                                svgColor: context.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}