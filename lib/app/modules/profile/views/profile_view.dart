import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        ),
        body: SizedBox(
          width: 100.w,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CommonImageView(
                      url: Get.arguments["data"]["imageUrl"] == null ||
                              Get.arguments["data"]["imageUrl"] == ""
                          ? "https://t4.ftcdn.net/jpg/03/46/93/61/360_F_346936114_RaxE6OQogebgAWTalE1myseY1Hbb5qPM.jpg"
                          : Get.arguments["data"]["imageUrl"]),
                ),
              ),
              10.kheightBox,
              Text(
                Get.arguments["data"]["name"],
                style: AppTextStyles.rubik20w400(color: context.black),
              ),
              Text(
                Get.arguments["data"]["phoneNo"],
                style: AppTextStyles.rubik15w600(color: context.black),
              ),
              Text(
                "Last seen today at 11:05",
                style: AppTextStyles.rubik12w400(color: context.black),
              ),
              30.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: context.grey),
                    child: Center(
                      child: CommonImageView(
                        svgPath: AppSvg.videoIconChat,
                        svgColor: context.secondaryBlue,
                        width: 30,
                      ),
                    ),
                  ),
                  20.kwidthBox,
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: context.grey),
                    child: Center(
                      child: CommonImageView(
                        svgPath: AppSvg.callIcon,
                        svgColor: context.secondaryBlue,
                        width: 30,
                      ),
                    ),
                  )
                ],
              ),
              30.kheightBox,
              Row(
                children: [
                  20.kwidthBox,
                  Text(
                    "Media, links and docs",
                    style: AppTextStyles.inter14w500(color: context.black),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: SizedBox(
                  height: 100,
                  width: 100.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CommonImageView(
                          url:
                              "https://s3-alpha-sig.figma.com/img/4e99/c1ff/253adbbd19ef16c4c9570cb9c5845ea6?Expires=1722211200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ht3M3F2ZjRqy5TWnQI~92tqfsHYqkP2p6H02tM1h~NxF1lfw9YJECKuxM-rxjX3ZmwYoBHQE7r31nvWHz5ozwMwLduwt2iwMqO1ADWJ5qFdbDCHfBnSlH6YcacfGS28yUCL4w039P7zJBjhDAaSuWY5L1ygjHAueWDZjUaeJlxAT4SxoWzyae6e3RD6pHYSmUvDXS318ygVoHzmkr430IvY60a7Q948sVrgO9AhbePDbV0PSs7CAQgjB9KKBd3p2g~v4KuQHYNYT2jTHc3kBAzLGafjurhlZeqwjZxgxI0L52u6MF4rvJ7jyubcqS-C3W7DRyktISf4ooBUtUqINbA__",
                        ),
                      );
                    },
                  ),
                ),
              ),
              30.kheightBox,
              Row(
                children: [
                  20.kwidthBox,
                  Icon(
                    Icons.notifications_none_outlined,
                    color: context.secondaryBlue,
                  ),
                  5.kwidthBox,
                  Text(
                    "Notifications ",
                    style: AppTextStyles.rubik12w400(color: context.black),
                  )
                ],
              ),
              20.kheightBox,
              Row(
                children: [
                  20.kwidthBox,
                  Icon(
                    Icons.block,
                    color: context.secondaryBlue,
                  ),
                  5.kwidthBox,
                  Text(
                    "Block contact ",
                    style: AppTextStyles.rubik12w400(color: context.black),
                  )
                ],
              ),
              20.kheightBox,
              Row(
                children: [
                  20.kwidthBox,
                  Icon(
                    Icons.flag_outlined,
                    color: context.secondaryBlue,
                  ),
                  5.kwidthBox,
                  Text(
                    "Report contact ",
                    style: AppTextStyles.rubik12w400(color: context.black),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
