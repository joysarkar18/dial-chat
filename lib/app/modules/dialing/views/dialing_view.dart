import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dialing_controller.dart';

class DialingView extends GetView<DialingController> {
  const DialingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.secondaryBlue,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.kheightBox,
                Text(
                  AppStrings.dialing,
                  style: AppTextStyles.inter24w500(color: context.white),
                ),
                10.kheightBox,
                Text(
                  'Shaun',
                  style: AppTextStyles.inter36w600(color: context.white),
                ),
                Text(
                  AppStrings.number,
                  style: AppTextStyles.inter24w400(color: context.white),
                ),
                60.kheightBox,
                Container(
                  height: 80.kh,
                  decoration: BoxDecoration(
                      color: context.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CommonImageView(
                        svgPath: AppSvg.speaker,
                      ),
                      CommonImageView(
                        svgPath: AppSvg.muteCall,
                      ),
                      CommonImageView(
                        svgPath: AppSvg.addCall,
                      ),
                      CommonImageView(
                        svgPath: AppSvg.keypad,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Spacer(),
                Center(
                  child: Container(
                    height: 150.kh,
                    width: 150.kw,
                    decoration: BoxDecoration(
                        color: context.lightGreen, shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        'S',
                        style: AppTextStyles.roboto70w400(color: context.white),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Get.back(),
                  child: Center(
                    child: CommonImageView(
                      svgPath: AppSvg.endCall,
                      height: 100.kh,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ));
  }
}
