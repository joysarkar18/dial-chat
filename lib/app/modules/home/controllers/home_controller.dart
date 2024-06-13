import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

class HomeController extends GetxController {
  // List to store contacts
  final contacts = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    _requestPermissionAndFetchContacts();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Method to request permission and fetch contacts
  void _requestPermissionAndFetchContacts() async {
    PermissionStatus permissionStatus = await _getContactPermission();

    if (permissionStatus == PermissionStatus.granted) {
      _fetchContacts();
    } else {
      // Handle the case when permission is not granted
      Get.snackbar(
          'Permission Denied', 'Cannot access contacts without permission');
    }
  }

  // Method to request contact permission
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

  // Method to fetch contacts
  void _fetchContacts() async {
    Iterable<Contact> contactsList = await ContactsService.getContacts();
    contacts.assignAll(contactsList);
  }

  // Increment method for count
  final count = 0.obs;
  void increment() => count.value++;
}
