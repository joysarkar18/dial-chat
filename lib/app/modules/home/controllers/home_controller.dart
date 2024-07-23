import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/utils/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeController extends GetxController {
  // Stream to hold all chats data
  var allChats = Stream<List<Map<String, dynamic>>>.empty();
  Map<String, dynamic>? userData;

  // RxBool to indicate loading state
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getuserData();
    getAllMyChatsStream(); // Use the stream-based method
    _requestPermissionAndFetchContacts();
    requestMicrophonePermission();
  }

  void requestMicrophonePermission() async {
    print("get mic access called");
    PermissionStatus status = await Permission.microphone.request();
    PermissionStatus status2 = await Permission.camera.request();
  }

  // Fetches user data (unchanged)
  void getuserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      userData = value.data();
      isLoading.value = false;
    });
  }

  // Creates a stream for all chats data
  void getAllMyChatsStream() async {
    allChats = FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("chatRooms")
        .snapshots()
        .map((querySnapshot) {
      // Convert the query snapshot to a list of maps
      List<Map<String, dynamic>> chatRooms = querySnapshot.docs
          .map((e) => e.data() as Map<String, dynamic>)
          .toList();

      // Sort the list based on the 'lastUpdate' timestamp in descending order
      chatRooms.sort((a, b) {
        Timestamp aTimestamp = a['lastUpdate'] as Timestamp;
        Timestamp bTimestamp = b['lastUpdate'] as Timestamp;
        return bTimestamp.compareTo(aTimestamp);
      });

      return chatRooms;
    });
  }

  // Request permission and fetch contacts (unchanged)
  void _requestPermissionAndFetchContacts() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
    } else {
      Get.snackbar(
          'Permission Denied', 'Cannot access contacts without permission');
    }
  }

  // Request contact permission (unchanged)
  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted) {
      Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ?? PermissionStatus.denied;
    } else {
      return permission;
    }
  }

  // Increment method (unchanged)
  final count = 0.obs;
  void increment() => count.value++;
// Import the intl package

  String formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    DateTime now = DateTime.now();
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);

    // Custom formatter for hours without leading zero
    String formatTime(DateTime dateTime) {
      final formatter =
          DateFormat('h:mm a'); // Use 'h' for hour without leading zero
      return formatter.format(dateTime);
    }

    // Check if the dateTime is today
    if (DateFormat('yyyyMMdd').format(dateTime) ==
        DateFormat('yyyyMMdd').format(now)) {
      return formatTime(dateTime);
    }
    // Check if the dateTime is tomorrow
    else if (DateFormat('yyyyMMdd').format(dateTime) ==
        DateFormat('yyyyMMdd').format(tomorrow)) {
      return "Tomorrow, ${formatTime(dateTime)}";
    }
    // Otherwise, return the date in MM/dd/yy format
    else {
      return "${DateFormat('MM/dd/yy').format(dateTime)}, ${formatTime(dateTime)}";
    }
  }
}
