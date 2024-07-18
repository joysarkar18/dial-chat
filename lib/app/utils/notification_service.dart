import 'dart:convert';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> initialize() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message: ${message.messageId}');
      if (message.notification != null) {
        _showCallNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
      _showCallNotification(message);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    _firebaseMessaging.getToken().then((token) {
      print('Device Token: $token');
      _saveTokenToDatabase(token);
    });

    _firebaseMessaging.onTokenRefresh.listen(_saveTokenToDatabase);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    _showCallNotification(message);
    print('Handling a background message: ${message.messageId}');
  }

  static Future<void> _showCallNotification(RemoteMessage message) async {
    if (message.notification == null) return;

    String callType = message.data['callType'];
    String callId = message.data['callId'];

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'call_channel',
        title: message.notification?.title ?? 'Incoming Call',
        body: message.notification?.body ?? 'You have a call',
        payload: {
          'callId': callId,
          'callType': callType,
        },
        autoDismissible: false,
        category: NotificationCategory.Call,
        fullScreenIntent: true,
        wakeUpScreen: true,
        backgroundColor: Colors.amber,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
            key: 'ACCEPT_CALL',
            label: 'Accept',
            color: Colors.green,
            autoDismissible: true),
        NotificationActionButton(
            key: 'DECLINE_CALL',
            label: 'Decline',
            color: Colors.red,
            autoDismissible: true),
      ],
    );

    AwesomeNotifications().setListeners(
      onActionReceivedMethod: (ReceivedAction receivedAction) async {
        if (receivedAction.buttonKeyPressed == "ACCEPT_CALL") {
          handleMessage(message);
        }
      },
      onNotificationCreatedMethod:
          (ReceivedNotification receivedNotification) async {},
      onNotificationDisplayedMethod:
          (ReceivedNotification receivedNotification) async {},
      onDismissActionReceivedMethod: (ReceivedAction receivedAction) async {},
    );
  }

  static Future<void> _saveTokenToDatabase(String? token) async {
    if (token == null) return;
    await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'fcmToken': token});
  }

  static Future<void> handleMessage(RemoteMessage message) async {
    String callId = message.data['callId'];
    String callType = message.data['callType'];
    print(callType);
    print(callType);
    print(callType);
    print(callType);

    _navigateToCallScreen(callId, callType);
  }

  static Future<void> _navigateToCallScreen(
      String callId, String callType) async {
    if (callType == "video") {
      await Get.toNamed(Routes.CHAT_CALL, arguments: {
        'callId': callId,
        'receiverId': FirebaseAuth.instance.currentUser!.uid,
        'isCaller': false,
      });
    } else if (callType == "audio") {
      await Get.toNamed(Routes.VOICE_CALL, arguments: {
        'callId': callId,
        'receiverId': FirebaseAuth.instance.currentUser!.uid,
        'isCaller': false,
      });
    }
  }
}

// AwesomeNotifications().actionStream.listen((receivedNotification) {
//   NotificationService._onSelectNotification(receivedNotification);
// });
