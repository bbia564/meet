import 'package:get/get.dart';

import 'used_list_logic.dart';

class UsedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsedListLogic());
  }
}
