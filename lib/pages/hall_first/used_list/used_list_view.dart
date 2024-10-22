import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_hall/pages/hall_first/used_list/used_item.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../db_hall/hall_entity.dart';
import 'used_list_logic.dart';

class UsedListPage extends GetView<UsedListLogic> {
  const UsedListPage({Key? key, required this.list}) : super(key: key);

  final List<HallEntity> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: list.isEmpty
          ? Center(
              child: <Widget>[
                Image.asset(
                  'assets/noData.webp',
                  width: 55,
                  height: 71,
                  fit: BoxFit.cover,
                ),
                const Text(
                  'No data',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ].toColumn(mainAxisAlignment: MainAxisAlignment.center),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: list.length,
              itemBuilder: (_, index) {
                final entity = list[index];
                return UsedItem(entity);
              }),
    );
  }
}
