import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            60.kheightBox,
            Center(
              child: Text(
                'Calling...',
                style: AppTextStyles.roboto24w400(color: context.white),
              ),
            ),
            40.kheightBox,
            Text(
              'Joy Sarkar',
              style: AppTextStyles.roboto24w700(color: context.white),
            ),
            200.kheightBox,
            Center(
              child: SizedBox(
                height: 300.kh,
                width: 320.kw,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            CommonImageView(
                              svgPath: AppSvg.addCall,
                            ),
                            15.kheightBox,
                            Text(
                              'Add call',
                              style: AppTextStyles.roboto12w400(
                                  color: context.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CommonImageView(
                              svgPath: AppSvg.holdCall,
                            ),
                            12.kheightBox,
                            Text(
                              'Hold call',
                              style: AppTextStyles.roboto12w400(
                                  color: context.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CommonImageView(
                              svgPath: AppSvg.bluetooth,
                            ),
                            12.kheightBox,
                            Text(
                              'Bluetooth',
                              style: AppTextStyles.roboto12w400(
                                  color: context.white),
                            )
                          ],
                        ),
                      ],
                    ),
                    40.kheightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            CommonImageView(
                              svgPath: AppSvg.speaker,
                            ),
                            15.kheightBox,
                            Text(
                              'Speaker',
                              style: AppTextStyles.roboto12w400(
                                  color: context.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CommonImageView(
                              svgPath: AppSvg.muteCall,
                            ),
                            19.kheightBox,
                            Text(
                              'Mute',
                              style: AppTextStyles.roboto12w400(
                                  color: context.white),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            CommonImageView(
                              svgPath: AppSvg.keypad,
                            ),
                            19.kheightBox,
                            Text(
                              'Keypad',
                              style: AppTextStyles.roboto12w400(
                                  color: context.white),
                            )
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Get.back(),
                      child: CommonImageView(
                        svgPath: AppSvg.endCall,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
