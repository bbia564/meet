import 'package:get/get.dart';

import 'hall_add_logic.dart';

class HallAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HallAddLogic());
  }
}
