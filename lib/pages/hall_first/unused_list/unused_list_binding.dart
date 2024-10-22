import 'package:get/get.dart';

import 'unused_list_logic.dart';

class UnusedListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UnusedListLogic());
  }
}
