import 'package:get/get.dart';

import '../hall_first/hall_first_logic.dart';
import '../hall_second/hall_second_logic.dart';
import 'hall_tab_logic.dart';

class HallTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HallTabLogic());
    Get.lazyPut(() => HallFirstLogic());
    Get.lazyPut(() => HallSecondLogic());
  }
}
