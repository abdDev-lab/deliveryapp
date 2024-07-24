import 'package:deliveryapp/controller/homePageController.dart';
import 'package:deliveryapp/core/constant/appRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumHeadHome extends StatelessWidget {
  const CostumHeadHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(
          top: 15,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "hometitle".tr,
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 26),
              ),
            ),

            IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.notifications);
              },
              icon: Icon(UIcons.regularRounded.bell),
              iconSize: 25,
            ),
            //Container(
            //  width: 50,
            //  height: 40,
            //  child: Stack(children: [
            //    Center(
            //      child: Icon(UIcons.regularRounded.bell),
            //    ),
            //    Visibility(
            //        visible:receive ,
            //        child: Positioned(
            //            top: 12,
            //            left: 27,
            //            child: Container(
            //              height: 8,
            //              width: 8,
            //              decoration: BoxDecoration(
            //                  shape: BoxShape.circle, color: AppColor.mainColor),
            //            )))
            //  ]),
            //),
          ],
        ),
      ),
    );
  }
}
