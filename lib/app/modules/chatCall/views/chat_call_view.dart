import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_call_controller.dart';

class ChatCallView extends GetView<ChatCallController> {
  const ChatCallView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 100.h,
      width: 100.w,
      child: Column(
        children: [
          90.kheightBox,
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp'),
          ),
          10.kheightBox,
          Text(
            "Joy Sarkar",
            style: AppTextStyles.inter24w400(color: context.black),
          ),
          Text(
            "calling",
            style: AppTextStyles.inter14w500(color: context.black),
          ),
          Spacer(),
          Container(
            height: 90,
            width: 100.w,
            decoration: BoxDecoration(
                color: context.chatBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CommonImageView(
                  svgPath: AppSvg.speaker,
                ),
                CommonImageView(
                  svgPath: AppSvg.videoIconChat,
                  svgColor: context.secondaryBlue,
                  height: 30,
                ),
                CommonImageView(
                  svgPath: AppSvg.muteCall,
                ),
                InkWell(
                  onTap: Get.back,
                  child: CommonImageView(
                    svgPath: AppSvg.endCall,
                    height: 35,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
