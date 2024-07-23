import 'package:get/get.dart';

import '../controllers/profile_group_controller.dart';

class ProfileGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileGroupController>(
      () => ProfileGroupController(),
    );
  }
}
