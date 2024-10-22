import 'package:get/get.dart';

import 'hall_first_logic.dart';

class HallFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HallFirstLogic());
  }
}
