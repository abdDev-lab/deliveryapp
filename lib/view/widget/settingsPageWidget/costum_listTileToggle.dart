// ignore_for_file: file_names

import 'package:deliveryapp/controller/settingsPageController.dart';
import 'package:deliveryapp/core/constant/appColor.dart';

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class CostumListTileToggle extends GetView<SettingsControllerImp> {
  final String title;
  final IconData icon;
  final bool value;
  final void Function(bool) onToggle;
  const CostumListTileToggle(
      {super.key,
      required this.title,
      required this.icon,
      required this.onToggle,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      margin: const EdgeInsets.only(bottom: 5),
      child: ListTile(
        trailing: SizedBox(
            width: 48,
            child: FlutterSwitch(
              value: value,
              onToggle: onToggle,
              width: 40,
              height: 23,
              toggleSize: 15,
              inactiveColor: AppColor.secColor2,
              activeColor: AppColor.mainColor,
            )),
        title: Row(
          children: [
            Icon(
              icon,
              color: Get.isDarkMode ? Colors.white : Colors.black,
              size: 20,
            ),
            Container(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
