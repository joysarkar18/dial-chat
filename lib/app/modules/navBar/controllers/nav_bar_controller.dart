import 'package:dial_chat/app/modules/home/views/home_view.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum BottomTab {
  chats,
  calls,
  posts,
}

class NavBarController extends GetxController {
  //TODO: Implement NavBarController

  var selectedTab = BottomTab.chats.obs;
  var pages = {
    BottomTab.chats: const HomeView(),
    BottomTab.calls: const HomeView(),
    BottomTab.posts: const HomeView(),
  };

  void gotoSettingScreen() {
    Get.toNamed(Routes.SETTINGS);
  }

  void changeTab(BottomTab tab) {
    selectedTab.value = tab;
  }
}
