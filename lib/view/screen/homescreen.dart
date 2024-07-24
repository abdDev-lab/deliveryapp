import 'package:deliveryapp/controller/homeScreenContoller.dart';
import 'package:deliveryapp/core/functions/alert_exit_app.dart';
import 'package:deliveryapp/view/widget/homeWidgets/costumnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(

          bottomNavigationBar: const CostumNavigationBar(),
          body: WillPopScope(
              onWillPop: alertExitApp,
              child: controller.listpages.elementAt(controller.currentpage))),
    );
  }
}
