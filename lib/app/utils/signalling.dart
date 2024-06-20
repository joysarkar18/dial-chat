import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NotificationService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final AudioPlayer _audioPlayer = AudioPlayer();

  static Future<void> initialize() async {
    // Request permissions for iOS
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

    // Initialize local notifications
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: _onSelectNotification);

    // Setup message handlers
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message: ${message.messageId}');
      if (message.notification != null) {
        _showCallNotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked!');
      _handleMessage(message);
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Get the token each time the application loads
    _firebaseMessaging.getToken().then((token) {
      print('Device Token: $token');
      _saveTokenToDatabase(token);
    });

    // Any time the token refreshes, store this in the database too.
    _firebaseMessaging.onTokenRefresh.listen(_saveTokenToDatabase);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print('Handling a background message: ${message.messageId}');
  }

  static Future<void> _showCallNotification(RemoteMessage message) async {
    if (message.notification == null) return;

    String callType = message.data['callType'];
    String callId = message.data['callId'];

    final AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
      ongoing: true,
      styleInformation: BigTextStyleInformation(''),
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          'ACCEPT_CALL',
          'End & Accept',
          icon: DrawableResourceAndroidBitmap(
              'mipmap/ic_launcher'), // Use DrawableResourceAndroidBitmap
        ),
        AndroidNotificationAction(
          'DECLINE_CALL',
          'Decline',
          icon: DrawableResourceAndroidBitmap(
              'mipmap/ic_launcher'), // Use DrawableResourceAndroidBitmap
        ),
      ],
    );

    final NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      platformChannelSpecifics,
      payload: jsonEncode({'callId': callId, 'callType': callType}),
    );

    // Play ringtone
    await _audioPlayer.play(AssetSource('assets/ringtone.mp3'));
  }

  static Future<void> _saveTokenToDatabase(String? token) async {
    if (token == null) return;

    // Assuming a collection 'users' where each document is a user with their token
    // Replace with your own user ID logic
    await _firestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'fcmToken': token});
  }

  static Future<void> _handleMessage(RemoteMessage message) async {
    // Extract necessary data from the message payload
    String callId = message.data['callId'];
    String callType = message.data['callType'];

    _navigateToCallScreen(callId, callType);
  }

  static Future<void> _onSelectNotification(
      NotificationResponse response) async {
    if (response.payload == null) return;

    Map<String, dynamic> data = jsonDecode(response.payload!);
    String callId = data['callId'];
    String callType = data['callType'];

    if (response.actionId == 'ACCEPT_CALL') {
      _navigateToCallScreen(callId, callType);
    } else if (response.actionId == 'DECLINE_CALL') {
      // Handle decline action
      // Stop ringtone
      await _audioPlayer.stop();
      // You can also remove the notification
      await _flutterLocalNotificationsPlugin.cancelAll();
    }
  }

  static Future<void> _navigateToCallScreen(
      String callId, String callType) async {
    // Stop ringtone
    await _audioPlayer.stop();

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
