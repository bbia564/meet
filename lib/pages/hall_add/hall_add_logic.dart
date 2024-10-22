import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:office_hall/db_hall/db_hall.dart';
import 'package:office_hall/db_hall/hall_entity.dart';

class HallAddLogic extends GetxController {

  DBHall dbHall = Get.find<DBHall>();

  HallEntity? entity = Get.arguments;

  bool showDelete = false;

  Uint8List? imageData;
  String title = '';
  var seatNum = 0;

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        imageData = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void addSub({bool isAdd = true}) {
    if (isAdd) {
      seatNum += 1;
    } else {
      if (seatNum > 0) {
        seatNum -= 1;
      }
    }
    update();
  }

  void save(BuildContext context) async {
    if (title.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the hall name');
      return;
    }
    if (seatNum == 0) {
      Fluttertoast.showToast(msg: 'Please enter the correct seat number');
      return;
    }
    if (imageData == null) {
      Fluttertoast.showToast(msg: 'Please select a picture');
      return;
    }
    FocusScope.of(context).requestFocus(FocusNode());
    if (entity == null) {
      final currentEntity = HallEntity(id: 0,
          createTime: DateTime.now(),
          imageData: imageData!,
          title: title,
          totalSeat: seatNum,
          description: '',
          usedSeat: 0);
      await dbHall.insertHall(currentEntity);
      Get.back();
    } else {
      final currentEntity = HallEntity(id: entity!.id,
          createTime: entity!.createTime,
          imageData: imageData!,
          title: title,
          totalSeat: seatNum,
          description: entity!.description,
          usedSeat: entity!.usedSeat);
      await dbHall.updateHall(currentEntity);
      Get.back(result: currentEntity);
    }
    Fluttertoast.showToast(msg: 'Success');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (entity != null) {
      imageData = entity!.imageData;
      title = entity!.title;
      seatNum = entity!.totalSeat;
      final showDeleteStr = Get.parameters['showDelete'] ;
      if (showDeleteStr != null) {
        showDelete = true;
      }
    }
    update();
    super.onInit();
  }

}
