import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CostumNotificationsListTile extends StatelessWidget {
  final String message;
  final String notificationdate;
  final bool isread;
  const CostumNotificationsListTile(
      {super.key,
      required this.message,
      required this.isread,
      required this.notificationdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
        boxShadow: Get.isDarkMode ? null : [
          BoxShadow(
              blurRadius: 8,
              color: const Color.fromARGB(255, 217, 217, 217).withOpacity(0.5),
              offset: const Offset(0, 0))
        ],
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              message,
              style:  TextStyle(
                fontSize: 17,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          isread == false
              ? Container(
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColor.mainColor),
                )
              : SizedBox(
                  width: 80,
                  child: Text(Jiffy.parse(notificationdate).fromNow() , textAlign: TextAlign.center,),
                )
        ],
      ),
    );
  }
}
