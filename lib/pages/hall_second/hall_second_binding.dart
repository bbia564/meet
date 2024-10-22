import 'package:get/get.dart';

import 'hall_second_logic.dart';

class HallSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HallSecondLogic());
  }
}
