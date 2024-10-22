import 'package:get/get.dart';

import 'setting_hall_logic.dart';

class SettingHallBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingHallLogic());
  }
}
