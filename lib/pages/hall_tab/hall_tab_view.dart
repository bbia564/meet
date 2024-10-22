import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_hall/pages/hall_add/hall_add_view.dart';
import 'package:office_hall/pages/hall_first/hall_first_logic.dart';
import 'package:office_hall/pages/hall_first/hall_first_view.dart';

import '../../main.dart';
import '../hall_second/hall_second_view.dart';
import 'hall_tab_logic.dart';

class HallTabPage extends GetView<HallTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          const HallFirstPage(),
          HallAddPage(),
          HallSecondPage(),
        ],
      ),
      bottomNavigationBar: Obx(()=>_navHallBars()),
    );
  }

  Widget _navHallBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/item0Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.add_circle,color: primaryColor,size: 40,),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Unselect.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon:Image.asset('assets/item1Selected.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 0) {
          HallFirstLogic hallFirstLogic = Get.find<HallFirstLogic>();
          hallFirstLogic.getData();
        }
        if (index == 1) {
          Get.toNamed('/hall_add')?.then((_){
            HallFirstLogic hallFirstLogic = Get.find<HallFirstLogic>();
            hallFirstLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
