// ignore_for_file: file_names

import 'package:deliveryapp/controller/homePageController.dart';
import 'package:deliveryapp/controller/pendingordersController.dart';
import 'package:deliveryapp/view/screen/ordersPending.dart';
import 'package:deliveryapp/view/screen/settingspage.dart';
import 'package:deliveryapp/view/widget/locationWidgets/locationPermission.dart';
import 'package:deliveryapp/view/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  @override
  void onInit() {
    determinePosition();
    //currentpage = Get.arguments["currentpage"] ?? 0 ;
    super.onInit();
  }

  int currentpage = 0;
  List<Widget> listpages = [
    const HomePage(),
    const OrdersPending(),
    const SettingsPage(),
  ];
  List<IconData> listiconsolid = [
    UIcons.solidRounded.home,
    UIcons.solidRounded.box_alt,
    UIcons.solidRounded.settings,
  ];
  List<IconData> listiconrounded = [
    UIcons.regularRounded.home,
    UIcons.regularRounded.box_alt,
    UIcons.regularRounded.settings,
  ];
  @override
  changepage(int i) {
    currentpage = i;
    if (currentpage == 0) {
      Get.delete<HomeControllerImp>();
      Get.put(HomeControllerImp());
    }
    if (currentpage == 1) {
      Get.delete<PendingOrdersControllerImp>();
      Get.put(PendingOrdersControllerImp());
    }

    update();
  }
}
