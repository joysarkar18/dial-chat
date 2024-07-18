import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dial_chat/app/modules/calls/views/calls_view.dart';
import 'package:dial_chat/app/modules/home/views/home_view.dart';
import 'package:dial_chat/app/modules/posts/views/posts_view.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  Future<void> onInit() async {
    super.onInit();

    _requestNotificationPermission();
    final RemoteMessage? _message =
        await FirebaseMessaging.instance.getInitialMessage();
    if (_message != null) {
      print(_message.data);
      NotificationService.handleMessage(_message);
    } else {
      print("No messame data");
    }

    ReceivedAction? receivedAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
    if (receivedAction != null) {
      if (receivedAction.channelKey == 'call_channel') {
        String? callType = receivedAction.payload!["callType"];
        String? callId = receivedAction.payload!["callId"];
        if (callType != null) {
          if (callType == "audio") {
            Get.toNamed(Routes.VOICE_CALL, arguments: {
              'callId': callId,
              'receiverId': FirebaseAuth.instance.currentUser!.uid,
              'isCaller': false,
            });
          }
          if (callType == "video") {
            Get.toNamed(Routes.CHAT_CALL, arguments: {
              'callId': callId,
              'receiverId': FirebaseAuth.instance.currentUser!.uid,
              'isCaller': false,
            });
          }
        }
      } else {
        Get.toNamed(Routes.DIAL_PAD);
      }
    }
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
