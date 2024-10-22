import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_hall/main.dart';
import 'package:office_hall/pages/hall_first/used_list/used_list_view.dart';
import 'package:styled_widget/styled_widget.dart';

import 'hall_first_logic.dart';
import 'unused_list/unused_list_view.dart';

class HallFirstPage extends StatefulWidget {
  const HallFirstPage({Key? key}) : super(key: key);

  @override
  State<HallFirstPage> createState() => _HallFirstPageState();
}

class _HallFirstPageState extends State<HallFirstPage>
    with SingleTickerProviderStateMixin {
  HallFirstLogic controller = Get.find<HallFirstLogic>();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Icon(
            Icons.add,
            size: 30,
            color: primaryColor,
          ).marginOnly(right: 20).gestures(onTap: () {
            Get.toNamed('/hall_add')?.then((_) {
              controller.getData();
            });
          })
        ],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SafeArea(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                child: <Widget>[
                  Theme(
                    data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        useMaterial3: true,
                        tabBarTheme: const TabBarTheme(
                            indicatorColor: Colors.transparent)),
                    child: TabBar(
                      tabAlignment: TabAlignment.fill,
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                      labelPadding: EdgeInsets.zero,
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      indicatorWeight: 2,
                      indicatorColor: primaryColor,
                      tabs: const [
                        SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: Tab(
                              text: "Used",
                            )),
                        SizedBox(
                            width: double.infinity,
                            height: 40,
                            child: Tab(
                              text: "Unused",
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                        width: double.infinity,
                        child: GetBuilder<HallFirstLogic>(builder: (_) {
                          return TabBarView(
                            controller: _tabController,
                            children: [
                              UsedListPage(list: controller.usedList,),
                              UnusedListPage(list: controller.unusedList,),
                            ],
                          );
                        }),
                      ))
                ].toColumn().paddingAll(12))
                .decorated(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12))
                .marginAll(12),
          ))
          .decorated(
          gradient: const LinearGradient(
              colors: [Color(0xffd0e2ff), Color(0xfff8f8f8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
