import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_hall/main.dart';
import 'package:office_hall/pages/hall_add/hall_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'hall_add_logic.dart';

class HallAddPage extends GetView<HallAddLogic> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HallAddLogic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.entity == null ? 'Add' : 'Edit'),
          backgroundColor: Colors.white,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15),
                              child: <Widget>[
                                const Text(
                                  'Hall name',
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: HallTextField(
                                        value: controller.title,
                                        textAlign: TextAlign.end,
                                        maxLength: 15,
                                        onChange: (value) {
                                          controller.title = value;
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15),
                              child: <Widget>[
                                const Text(
                                  'Seat',
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
                                        value: controller.seatNum.toString(),
                                        maxLength: 5,
                                        textAlign: TextAlign.center,
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: primaryColor),
                                        isInteger: true,
                                        onChange: (value) {
                                          controller.seatNum =
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
                                ].toRow(
                                    mainAxisAlignment: MainAxisAlignment.end)
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
                              child: Text(
                                controller.entity == null ? 'Commit' : 'Edit',
                                style: const TextStyle(
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
                            }),
                            Visibility(
                              visible: controller.showDelete,
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                child:const Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                                  .decorated(
                                  color: Colors.grey.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12))
                                  .marginOnly(top: 15)
                                  .gestures(onTap: () async {
                                await controller.dbHall.deleteHall(controller.entity!);
                                Get.back();
                              }),
                            )
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
                                child: controller.imageData == null
                                    ? Image.asset(
                                  'assets/defaultIcon.webp',
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                )
                                    : Image.memory(
                                  controller.imageData!,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                )),
                            Positioned(
                              right: 0,
                              bottom: 20,
                              child: Image.asset(
                                'assets/camera.webp',
                                width: 33,
                                height: 33,
                                fit: BoxFit.cover,
                              ),
                            )
                          ],
                        ).gestures(onTap: () {
                          controller.imageSelected();
                        }),
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
