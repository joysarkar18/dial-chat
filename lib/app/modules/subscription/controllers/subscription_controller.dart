import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  //TODO: Implement SubscriptionController

  var selectedView = 0.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void selectView(int viewIndex) {
    selectedView.value = viewIndex;
  }

  void increment() => count.value++;
}
