import 'package:get/get.dart';
import 'package:office_hall/db_hall/db_hall.dart';

import '../../db_hall/hall_entity.dart';

class HallFirstLogic extends GetxController {

  DBHall dbHall = Get.find<DBHall>();

  var usedList = <HallEntity>[];
  var unusedList = <HallEntity>[];

  void getData() async {
    final result = await dbHall.getAllData();
    usedList = result.where((element) => element.isUsed).toList();
    unusedList = result.where((element) => !element.isUsed).toList();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
