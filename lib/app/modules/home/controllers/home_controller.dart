import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

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
        .map((querySnapshot) =>
            querySnapshot.docs.map((e) => e.data()).toList());
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
}
