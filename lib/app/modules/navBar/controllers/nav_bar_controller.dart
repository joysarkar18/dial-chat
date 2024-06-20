import 'package:dial_chat/app/modules/calls/views/calls_view.dart';
import 'package:dial_chat/app/modules/home/views/home_view.dart';
import 'package:dial_chat/app/modules/posts/views/posts_view.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

enum BottomTab {
  chats,
  calls,
  posts,
}

class NavBarController extends GetxController {
  var selectedTab = BottomTab.chats.obs;
  var pages = {
    BottomTab.chats: const HomeView(),
    BottomTab.calls: const CallsView(),
    BottomTab.posts: const PostsView(),
  };

  @override
  void onInit() {
    super.onInit();
    _requestNotificationPermission();
    NotificationService.initialize();
  }

  void gotoSettingScreen() {
    Get.toNamed(Routes.SETTINGS);
  }

  void changeTab(BottomTab tab) {
    selectedTab.value = tab;
  }

  // Method to request notification permission
  void _requestNotificationPermission() async {
    PermissionStatus permissionStatus = await Permission.notification.status;

    if (permissionStatus != PermissionStatus.granted) {
      Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.notification].request();
      if (permissionStatus[Permission.notification] !=
          PermissionStatus.granted) {
        // Handle the case when permission is not granted
        Get.snackbar('Permission Denied',
            'Cannot show notifications without permission');
      }
    }
  }
}
