import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:deliveryapp/controller/homeScreenContoller.dart';
import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumNavigationBar extends StatelessWidget {
  const CostumNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => CurvedNavigationBar(
                index: controller.currentpage,
                onTap: (value) {
                  controller.changepage(value);
                },
                height: 60,
                color:Theme.of(context).primaryColor ,
                buttonBackgroundColor: AppColor.mainColor,
                backgroundColor: Get.isDarkMode?Theme.of(context).colorScheme.secondary : AppColor.secColor2,
                animationDuration: const Duration(milliseconds: 1),
                items: [
                  ...List.generate(
                    controller.listpages.length,
                    (index) => SizedBox(
                      height: 30,
                      width: 30,
                      child: Icon(
                        controller.currentpage == index
                            ? controller.listiconsolid.elementAt(index)
                            : controller.listiconrounded.elementAt(index),
                        color: controller.currentpage == index
                            ? Colors.white
                            : Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                ]));
  }
}
