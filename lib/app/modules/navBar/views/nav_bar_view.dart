import 'package:dial_chat/app/components/common_image_view.dart';
import 'package:dial_chat/app/constants/svg_constant.dart';
import 'package:dial_chat/app/constants/text_constants.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/color_util.dart';
import 'package:dial_chat/app/utils/responsive_size.dart';
import 'package:dial_chat/app/utils/text_styles_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                CommonImageView(
                  svgPath: AppSvg.appBarChatLogo,
                  height: 40.kh,
                ),
                Text(
                  AppStrings.dialChat,
                  style: AppTextStyles.rubik20w400(color: context.black),
                ),
                const Spacer(),
                CommonImageView(
                  svgPath: AppSvg.appBarSearchLogo,
                ),
                10.kwidthBox,
                InkWell(
                  onTap: () {},
                  child: CommonImageView(
                    svgPath: AppSvg.appBarCameraLogo,
                  ),
                ),
                10.kwidthBox,
                InkWell(
                  onTap: controller.gotoSettingScreen,
                  child: CommonImageView(
                    svgPath: AppSvg.appBarMoreLogo,
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
              height: 60.kh,
              color: context.navBarColor,
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60.kh,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BottomNavItem(
                          icon: controller.selectedTab.value == BottomTab.chats
                              ? AppSvg.chatIconFilled
                              : AppSvg.chatIcon,
                          label: AppStrings.chats,
                          isSelected:
                              controller.selectedTab.value == BottomTab.chats,
                          onPressed: () {
                            controller.changeTab(BottomTab.chats);
                          },
                        ),
                        BottomNavItem(
                          icon: controller.selectedTab.value == BottomTab.calls
                              ? AppSvg.callIconFilled
                              : AppSvg.callIcon,
                          label: AppStrings.calls,
                          isSelected:
                              controller.selectedTab.value == BottomTab.calls,
                          onPressed: () {
                            controller.changeTab(BottomTab.calls);
                          },
                        ),
                        BottomNavItem(
                          icon: controller.selectedTab.value == BottomTab.posts
                              ? AppSvg.postIconFilled
                              : AppSvg.postIcon,
                          label: AppStrings.posts,
                          isSelected:
                              controller.selectedTab.value == BottomTab.posts,
                          onPressed: () {
                            controller.changeTab(BottomTab.posts);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          body: controller.pages[controller.selectedTab.value],
        ));
  }
}

class BottomNavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.kh),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onPressed,
        child: SizedBox(
          width: 60.kw,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonImageView(
                svgPath: icon,
                // height: 41.kh,
                height: isSelected ? 30 : 26,
                // width: 41.kw,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(label,
                    style: AppTextStyles.inter12w500(
                      color: isSelected ? context.secondaryBlue : context.black,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
