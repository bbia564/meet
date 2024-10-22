import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:office_hall/db_hall/db_hall.dart';
import 'package:office_hall/pages/hall_add/hall_add_binding.dart';
import 'package:office_hall/pages/hall_add/hall_add_view.dart';
import 'package:office_hall/pages/hall_first/hall_first_binding.dart';
import 'package:office_hall/pages/hall_first/hall_first_view.dart';
import 'package:office_hall/pages/hall_first/used_list/used_edit.dart';
import 'package:office_hall/pages/hall_second/hall_second_binding.dart';
import 'package:office_hall/pages/hall_second/hall_second_view.dart';
import 'package:office_hall/pages/hall_tab/hall_tab_binding.dart';
import 'package:office_hall/pages/hall_tab/hall_tab_view.dart';
import 'package:office_hall/pages/hall_use/hall_use_binding.dart';
import 'package:office_hall/pages/hall_use/hall_use_view.dart';
import 'package:office_hall/pages/setting_hall/setting_hall_binding.dart';
import 'package:office_hall/pages/setting_hall/setting_hall_view.dart';

Color primaryColor = const Color(0xff3884ff);
Color bgColor = const Color(0xfff5f5f5);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBHall().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Roots,
      initialRoute: '/in',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Roots = [
  GetPage(
      name: '/in',
      page: () => const HallUseView(),
      binding: HallUseBinding() ),
  GetPage(
      name: '/hall_tab',
      page: () => HallTabPage(),
      binding: HallTabBinding()),
  GetPage(
      name: '/hall_first',
      page: () => const HallFirstPage(),
      binding: HallFirstBinding()),
  GetPage(
      name: '/hall_use',
      page: () => const UsedEdit()),
  GetPage(
      name: '/hall_second',
      page: () => HallSecondPage(),
      binding: HallSecondBinding()),
  GetPage(
      name: '/hall_add',
      page: () => HallAddPage(),
      binding: HallAddBinding()),
  GetPage(
      name: '/hall_setting',
      page: () => SettingHallPage(),
      binding: SettingHallBinding()),
];
