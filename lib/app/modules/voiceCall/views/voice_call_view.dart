import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/voice_call_controller.dart';

class VoiceCallView extends GetView<VoiceCallController> {
  const VoiceCallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CupertinoActivityIndicator(),
              )
            : Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: 100.w,
                          child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(Get.arguments["receiverId"])
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    children: [
                                      90.kheightBox,
                                      CircleAvatar(
                                        radius: 60,
                                        backgroundImage: NetworkImage(
                                          snapshot.data!["imageUrl"],
                                        ),
                                      ),
                                      10.kheightBox,
                                      Text(
                                        snapshot.data!["name"],
                                        style: AppTextStyles.inter24w400(
                                            color: context.black),
                                      ),
                                      Obx(() => Text(
                                            controller.isCallPicked.value
                                                ? controller.callDuration.value
                                                : "calling",
                                            style: AppTextStyles.inter14w500(
                                                color: context.black),
                                          )),
                                      const Spacer(),
                                    ],
                                  );
                                }
                                return SizedBox();
                              }),
                        ),
                      ),
                    ],
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.11,
                    minChildSize: 0.11,
                    maxChildSize: 0.4,
                    builder: (BuildContext context,
                        ScrollController scrollController) {
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
                                SizedBox(
                                  height: 90.kh,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.toggleSpeaker();
                                        },
                                        child: Obx(() => Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: controller
                                                          .isSpeakerEnabled
                                                          .value
                                                      ? context.grey
                                                      : Colors.transparent),
                                              child: CommonImageView(
                                                svgPath: AppSvg.speaker,
                                              ),
                                            )),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.toggleMute();
                                        },
                                        child: Obx(() => Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color:
                                                      controller.isMuted.value
                                                          ? context.grey
                                                          : Colors.transparent),
                                              child: CommonImageView(
                                                svgPath: AppSvg.muteCall,
                                              ),
                                            )),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.hangUp(
                                              controller.localVideoRenderer);
                                          Get.back();
                                        },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
      ),
    );
  }
}
