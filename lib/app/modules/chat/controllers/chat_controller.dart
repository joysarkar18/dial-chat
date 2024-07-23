import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dial_chat/app/models/user_model.dart';
import 'package:dial_chat/app/modules/home/controllers/home_controller.dart';
import 'package:dial_chat/app/routes/app_pages.dart';
import 'package:dial_chat/app/utils/Dialog_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final messages = <DocumentSnapshot>[].obs;
  final messageController = TextEditingController();
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;
  late CollectionReference chatReference;
  late Stream<QuerySnapshot> chatStream;
  late UserModel currentSender;

  @override
  void onInit() {
    super.onInit();
    final chatId = Get.arguments[0]["chatID"];
    chatReference =
        _firestore.collection('chats').doc(chatId).collection('messages');
    chatStream =
        chatReference.orderBy('timestamp', descending: true).snapshots();
    chatStream.listen((QuerySnapshot snapshot) {
      messages.assignAll(snapshot.docs);
    });
    _initializeRecorder();
  }

  Future<void> _initializeRecorder() async {
    await _recorder.openRecorder();
    await Permission.microphone.request();
  }

  Future<void> startRecording() async {
    await _recorder.startRecorder(
      toFile: 'audio.aac',
      codec: Codec.aacMP4,
    );
    _isRecording = true;
  }

  Future<void> stopRecording() async {
    if (!_isRecording) return;

    String? path = await _recorder.stopRecorder();
    _isRecording = false;

    if (path != null) {
      String downloadUrl = await uploadVoiceMessage(File(path));
      sendMessage(downloadUrl);
    }
  }

  Future<String> uploadVoiceMessage(File file) async {
    DialogHelper.showLoading();
    String fileName = 'voices/${DateTime.now().millisecondsSinceEpoch}.aac';
    TaskSnapshot taskSnapshot =
        await _storage.ref().child(fileName).putFile(file);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    DialogHelper.hideDialog();
    return downloadUrl;
  }

  void sendMessage(String text) async {
    if (text.isEmpty) return;
    chatReference.add({
      'text': text,
      'senderId': currentSender.uid,
      'timestamp': FieldValue.serverTimestamp(),
      "sendTo": FirebaseAuth.instance.currentUser!.uid,
    });

    _firestore
        .collection("users")
        .doc(currentSender.uid)
        .collection("chatRooms")
        .doc(Get.arguments[0]["chatID"])
        .set({
      "user": Get.find<HomeController>().userData,
      "lastUpdate": Timestamp.fromDate(DateTime.now()),
      "seen": false,
      "lastMessage": text,
      "chatId": Get.arguments[0]["chatID"],
    });

    _firestore
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("chatRooms")
        .doc(Get.arguments[0]["chatID"])
        .set({
      "user": UserModel.toJson(currentSender),
      "lastUpdate": Timestamp.fromDate(DateTime.now()),
      "seen": true,
      "lastMessage": text,
      "chatId": Get.arguments[0]["chatID"],
    });
    messageController.clear();
  }

  Future<void> sendImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Upload image to storage and get URL
      String imageUrl = await uploadImage(File(pickedFile.path));
      sendMessage(imageUrl);
    }
  }

  Future<void> sendDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      // Upload document to storage and get URL
      String documentUrl =
          await uploadDocument(File(result.files.single.path!));
      sendMessage(documentUrl);
    }
  }

  Future<void> sendLocation() async {
    // Request location permission if not already granted
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        "Location Services Disabled",
        "Please enable location services to send your location.",
      );
      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        Get.snackbar(
          "Location Permission Denied",
          "Location permission is required to send location.",
        );
        return;
      }
    }
    DialogHelper.showLoading();
    // Get current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    DialogHelper.hideDialog();
    // Format location message
    String locationMessage =
        'https://www.google.com/maps/?q=${position.latitude},${position.longitude}';

    // Send location as message
    sendMessage(locationMessage);
  }

  Future<void> sendContact() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      DialogHelper.showLoading();
      Iterable<Contact> contacts = await ContactsService.getContacts();
      DialogHelper.hideDialog();
      if (contacts.isNotEmpty) {
        Contact? selectedContact = await showDialog<Contact>(
          context: Get.context!,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Select Contact'),
              content: Container(
                width: double.maxFinite,
                height: 400,
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    Contact contact = contacts.elementAt(index);
                    return ListTile(
                      title: Text(contact.displayName ?? ''),
                      subtitle: Text(contact.phones!.isNotEmpty
                          ? contact.phones!.first.value!
                          : 'No phone number'),
                      onTap: () {
                        Navigator.pop(context, contact);
                      },
                    );
                  },
                ),
              ),
            );
          },
        );

        if (selectedContact != null) {
          String contactDetails =
              'Contact: ${selectedContact.displayName}, ${selectedContact.phones!.isNotEmpty ? selectedContact.phones!.first.value : 'No phone number'}';
          sendMessage(contactDetails);
        } else {
          Get.snackbar("No Contact Selected", "You did not select any contact");
        }
      } else {
        Get.snackbar("No Contacts", "No contacts found in your device");
      }
    } else {
      Get.snackbar("Permission Denied",
          "Contacts permission is required to send contacts");
    }
  }

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

  String getStatus(Timestamp timestamp) {
    DateTime lastSeen = timestamp.toDate();
    DateTime now = DateTime.now();
    Duration difference = now.difference(lastSeen);

    if (difference.inMinutes <= 1) {
      return 'Online';
    } else if (difference.inDays < 1) {
      return 'Last seen at ${DateFormat('hh:mm a').format(lastSeen)}';
    } else if (difference.inDays == 1) {
      return 'Last seen yesterday at ${DateFormat('hh:mm a').format(lastSeen)}';
    } else {
      return 'Last seen on ${DateFormat('MMM dd, yyyy hh:mm a').format(lastSeen)}';
    }
  }

  Future<String> uploadImage(File file) async {
    DialogHelper.showLoading();
    String fileName =
        'images/${DateTime.now().millisecondsSinceEpoch}images.png';
    TaskSnapshot taskSnapshot =
        await _storage.ref().child(fileName).putFile(file);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    DialogHelper.hideDialog();
    return downloadUrl;
  }

  Future<String> uploadDocument(File file) async {
    DialogHelper.showLoading();
    String fileName =
        'documents/${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';
    TaskSnapshot taskSnapshot =
        await _storage.ref().child(fileName).putFile(file);
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();
    DialogHelper.hideDialog();
    return downloadUrl;
  }

  void gotoProfilePage({required Map<String, dynamic> data}) {
    Get.toNamed(Routes.PROFILE, arguments: {"data": data});
  }
}
