import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_hall/db_hall/hall_entity.dart';
import 'package:office_hall/main.dart';
import 'package:styled_widget/styled_widget.dart';

import '../hall_first_logic.dart';

class UsedItem extends StatelessWidget {
  const UsedItem(this.entity, {Key? key}) : super(key: key);

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
        const SizedBox(width: 10),
        Expanded(
            child: <Widget>[
          <Widget>[
            Text(
              entity.title,
              style: const TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                entity.description,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ].toRow(),
          <Widget>[
            const Text(
              'Seats: ',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              entity.totalSeat.toString(),
              style: TextStyle(fontSize: 12, color: primaryColor),
            ),
            const SizedBox(
              width: 15,
            ),
            const Text(
              'Arrival: ',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              entity.usedSeat.toString(),
              style: TextStyle(fontSize: 12, color: primaryColor),
            ),
          ].toRow()
        ].toColumn()),
        const SizedBox(width: 10),
        const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        )
      ].toRow(),
    )
        .decorated(
            color: const Color(0xfff7f7f7),
            borderRadius: BorderRadius.circular(10))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      Get.toNamed('/hall_add',
          arguments: entity, parameters: {'showDelete': 'true'})?.then((_) {
        HallFirstLogic logic = Get.find<HallFirstLogic>();
        logic.getData();
      });
    });
  }
}
