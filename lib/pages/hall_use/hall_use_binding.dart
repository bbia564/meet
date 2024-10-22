import 'package:get/get.dart';

import 'hall_use_logic.dart';

class HallUseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
