import 'package:get/get.dart';

class DialPadController extends GetxController {
  //TODO: Implement DialPadController
  var input = ''.obs;

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

  void onPressed(String value) {
    input.value += value;
  }

  void deleteLastCharacter() {
    if (input.value.isNotEmpty) {
      input.value = input.value.substring(0, input.value.length - 1);
    }
  }

  void increment() => count.value++;
}
