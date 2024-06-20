import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import '../controllers/chat_call_controller.dart';

class ChatCallView extends GetView<ChatCallController> {
  const ChatCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.isLoading.value
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : SizedBox(
              height: 100.h,
              width: 100.w,
              child: Stack(
                children: [
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    left: 0.0,
                    bottom: 0.0,
                    child: RTCVideoView(
                      controller.remoteVideoRenderer,
                    ),
                  ),
                  Positioned(
                    right: 16.0,
                    bottom: 80.0,
                    width: 90.0,
                    height: 150.0,
                    child: RTCVideoView(
                      controller.localVideoRenderer,
                      mirror: true,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: 70.kh,
                      width: 100.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.rotateCamera();
                            },
                            child: CommonImageView(
                              svgPath: AppSvg.rotateCamera,
                              height: 38,
                              svgColor: context.secondaryBlue,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.toggleMute();
                            },
                            child: Obx(() => Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: controller.isMuted.value
                                          ? context.grey
                                          : Colors.transparent),
                                  child: CommonImageView(
                                    svgPath: AppSvg.muteCall,
                                  ),
                                )),
                          ),
                          InkWell(
                            onTap: () {
                              controller.hangUp(controller.localVideoRenderer);
                              Get.back();
                            },
                            child: CommonImageView(
                              svgPath: AppSvg.endCall,
                              height: 36,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
    );
  }
}
