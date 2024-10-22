import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:office_hall/db_hall/db_hall.dart';
import 'package:office_hall/db_hall/hall_entity.dart';

class SettingHallLogic extends GetxController {

  DBHall dbHall = Get.find<DBHall>();

  HallEntity entity = Get.arguments;

  void addSub({bool isAdd = true}) {
    if (isAdd) {
      if (entity.usedSeat < entity.totalSeat) {
        entity.usedSeat += 1;
      }
    } else {
      if (entity.usedSeat > 0) {
        entity.usedSeat -= 1;
      }
    }
    update();
  }

  void save(BuildContext context) async {
    if (entity.description.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill in the name');
      return;
    }
    if (entity.usedSeat == 0) {
      Fluttertoast.showToast(msg: 'Please enter the correct seat number');
      return;
    }
    await dbHall.updateHall(entity);
    Fluttertoast.showToast(msg: 'Success');
    Get.back();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    update();
    super.onInit();
  }

}
