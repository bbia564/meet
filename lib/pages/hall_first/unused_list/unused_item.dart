
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_hall/db_hall/hall_entity.dart';
import 'package:office_hall/pages/hall_first/hall_first_logic.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../main.dart';

class UnusedItem extends StatelessWidget {
  const UnusedItem(this.entity, {Key? key}) : super(key: key);

  final HallEntity entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      child: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.memory(
            entity.imageData,
            width: 45,
            height: 45,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: <Widget>[
          Text(
            entity.title,
            style: const TextStyle(fontSize: 14),
            overflow: TextOverflow.ellipsis,
          ),
          <Widget>[
            const Text(
              'Seats: ',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              entity.totalSeat.toString(),
              style: TextStyle(fontSize: 12, color: primaryColor),
            )
          ].toRow()
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start)),
        const SizedBox(
          width: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: const Text(
            'Use',
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        )
            .decorated(
                color: primaryColor, borderRadius: BorderRadius.circular(8))
            .gestures(onTap: () {
            Get.toNamed('/hall_setting',arguments: entity)?.then((_){
              HallFirstLogic logic = Get.find<HallFirstLogic>();
              logic.getData();
            });
        })
      ].toRow(),
    )
        .decorated(
            color: const Color(0xfff7f7f7),
            borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 10).gestures(onTap: (){
          Get.toNamed('/hall_add',arguments: entity,parameters: {'showDelete': 'true'})?.then((_) {
            HallFirstLogic logic = Get.find<HallFirstLogic>();
            logic.getData();
          });
    });
  }
}
