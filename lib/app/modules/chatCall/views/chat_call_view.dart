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
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: 100.w,
                  child: Column(
                    children: [
                      90.kheightBox,
                      const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
                        ),
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
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.11,
            minChildSize: 0.11,
            maxChildSize: 0.4,
            builder: (BuildContext context, ScrollController scrollController) {
              return GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                    color: context.chatBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 12.0),
                        //   child: Icon(
                        //     Icons.keyboard_arrow_up,
                        //     size: 26,
                        //     color: context.grey,
                        //   ),
                        // ),
                        SizedBox(
                          height: 90.kh,
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
                        ),
                        Divider(
                          color: context.lightGrey_2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 50.kh,
                                      width: 50.kw,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: context.lightGrey_2,
                                      ),
                                      child: const Center(
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    10.kwidthBox,
                                    Text(
                                      'Add Person',
                                      style: AppTextStyles.inter16w400(
                                        color: context.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              10.kheightBox,
                              Row(
                                children: [
                                  3.kwidthBox,
                                  const CircleAvatar(
                                    radius: 26,
                                    backgroundImage: NetworkImage(
                                      'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
                                    ),
                                  ),
                                  10.kwidthBox,
                                  Text(
                                    "Joy Sarkar",
                                    style: AppTextStyles.inter16w400(
                                      color: context.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_horiz),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
