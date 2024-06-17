import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/models/user_model.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: context.secondaryBlue,
              borderRadius: BorderRadius.circular(12)),
          child: IconButton(
              icon: CommonImageView(
                svgPath: AppSvg.chatButtonIcon,
              ),
              onPressed: () {
                Get.toNamed(Routes.SELECT_CONTACT);
              }),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 16.kw,
            right: 16.kw,
          ),
          child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: controller.allChats,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final chats = snapshot.data!;
                  return ListView.builder(
                    itemCount: chats.length,
                    itemBuilder: (context, index) => Container(
                      height: 70.kh,
                      width: 100.w,
                      padding: EdgeInsets.symmetric(vertical: 5.kh),
                      child: InkWell(
                          onTap: () {
                            print(chats[index]["chatId"]);
                            if (chats[index]["isGroupChat"] == null ||
                                chats[index]["isGroupChat"] == false) {
                              Get.toNamed(Routes.CHAT, arguments: [
                                {
                                  "name":
                                      chats[index]["user"]["name"].toString(),
                                  "user":
                                      UserModel.fromJson(chats[index]["user"]),
                                  "chatID": chats[index]["chatId"]
                                }
                              ]);
                            } else {
                              Get.toNamed(Routes.GROUP_CHAT, arguments: [
                                {
                                  "name": chats[index]["groupName"].toString(),
                                  "groupImage": chats[index]["groupLogoUrl"],
                                  "chatID": chats[index]["chatId"]
                                }
                              ]);
                            }
                          },
                          child: (chats[index]["isGroupChat"] == null ||
                                  chats[index]["isGroupChat"] == false)
                              ? Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(25.kh),
                                      child: CommonImageView(
                                        height: 50.kh,
                                        width: 50.kh,
                                        fit: BoxFit.cover,
                                        url: chats[index]["user"]["imageUrl"],
                                      ),
                                    ),
                                    20.kwidthBox,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          chats[index]["user"]["name"]
                                              .toString(),
                                          style: AppTextStyles.inter14w600(
                                              color: context.black),
                                        ),
                                        3.kheightBox,
                                        Text(
                                          chats[index]["lastMessage"]
                                              .toString(),
                                          style: AppTextStyles.inter12w300(
                                              color: context.grey),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 18.kh),
                                          child: Text(
                                            "10:22",
                                            style: AppTextStyles.inter12w300(
                                                color: context.grey),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : Row(
                                  children: [
                                    chats[index]["groupLogoUrl"]
                                            .toString()
                                            .isEmpty
                                        ? Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                color: context.secondaryBlue,
                                                shape: BoxShape.circle),
                                            child: Center(
                                              child: Icon(Icons.group),
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(25.kh),
                                            child: CommonImageView(
                                              height: 50.kh,
                                              width: 50.kh,
                                              fit: BoxFit.cover,
                                              url: chats[index]["groupLogoUrl"],
                                            ),
                                          ),
                                    20.kwidthBox,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          chats[index]["groupName"].toString(),
                                          style: AppTextStyles.inter14w600(
                                              color: context.black),
                                        ),
                                        3.kheightBox,
                                        Text(
                                          chats[index]["lastMessage"]
                                              .toString(),
                                          style: AppTextStyles.inter12w300(
                                              color: context.grey),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 18.kh),
                                          child: Text(
                                            "10:22",
                                            style: AppTextStyles.inter12w300(
                                                color: context.grey),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                    ),
                  );
                } else {
                  return Text("No chats");
                }
              }),
        ));
  }
}
