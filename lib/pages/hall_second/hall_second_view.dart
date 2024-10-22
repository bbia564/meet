import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'hall_second_logic.dart';

class HallSecondPage extends GetView<HallSecondLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Clean all data', 'About us'];
    return Container(
      height: 40,
      color: Colors.transparent,
      child: <Widget>[
        Text(titles[index]),
        index == 0 ? const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        ) : const Text('1.0.0').paddingOnly(right: 8)
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanHallData();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Setting')),
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: <Widget>[
                _item(0, context),
                _item(1, context),
              ].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12))
          ].toColumn(),
        ).marginAll(15)),
      ).decorated(
          gradient: const LinearGradient(
              colors: [Color(0xffd0e2ff), Color(0xfff8f8f8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
