import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../main.dart';
import '../hall_add/hall_text_field.dart';
import 'setting_hall_logic.dart';

class SettingHallPage extends GetView<SettingHallLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingHallLogic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.entity.title),
          backgroundColor: Colors.white,
          actions: [
            const Text(
              'Edit',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ).marginOnly(right: 20).gestures(onTap: () {
              Get.toNamed('/hall_add',
                  arguments: controller.entity)?.then((value) {
                    if (value != null) {
                      controller.entity = value;
                    }
                if (controller.entity.usedSeat > controller.entity.totalSeat) {
                  controller.entity.usedSeat = controller.entity.totalSeat;
                }
                controller.update();
              });
            })
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
              child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      child: <Widget>[
                        Container(
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: <Widget>[
                            const Text(
                              'Use name',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: HallTextField(
                                    value: controller.entity.description,
                                    textAlign: TextAlign.end,
                                    maxLength: 15,
                                    onChange: (value) {
                                      controller.entity.description = value;
                                    }))
                          ].toRow(),
                        )
                            .decorated(
                                color: const Color(0xfffafafa),
                                borderRadius: BorderRadius.circular(12))
                            .marginOnly(top: 60, bottom: 15),
                        Container(
                          width: double.infinity,
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: <Widget>[
                            const Text(
                              'Reserve a seat',
                              style: TextStyle(fontSize: 14),
                            ),
                            <Widget>[
                              Image.asset(
                                'assets/add.webp',
                                width: 20,
                                height: 20,
                              ).gestures(onTap: () {
                                controller.addSub(isAdd: true);
                              }),
                              Container(
                                child: HallTextField(
                                    value:
                                        controller.entity.usedSeat.toString(),
                                    maxLength: 5,
                                    textAlign: TextAlign.center,
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: primaryColor),
                                    isInteger: true,
                                    onChange: (value) {
                                      controller.entity.usedSeat =
                                          int.tryParse(value) ?? 0;
                                    }),
                              ).constrained(maxWidth: 90),
                              Image.asset(
                                'assets/subb.webp',
                                width: 20,
                                height: 20,
                              ).gestures(onTap: () {
                                controller.addSub(isAdd: false);
                              })
                            ].toRow(mainAxisAlignment: MainAxisAlignment.end)
                          ].toRow(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween),
                        )
                            .decorated(
                                color: const Color(0xfffafafa),
                                borderRadius: BorderRadius.circular(12))
                            .marginOnly(bottom: 15),
                        Container(
                          alignment: Alignment.center,
                          height: 50,
                          child: const Text(
                            'Commit',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                            .decorated(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12))
                            .marginOnly(top: 10)
                            .gestures(onTap: () {
                          controller.save(context);
                        })
                      ].toColumn(),
                    )
                        .decorated(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12))
                        .marginOnly(top: 40),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        const SizedBox(
                          width: 100,
                          height: 100,
                        ),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.memory(
                              controller.entity.imageData,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                  ],
                ),
              )
            ].toColumn(),
          ).marginAll(12)),
        ),
      );
    });
  }
}
