// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:uicons/uicons.dart';

class CostumListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onPress;
  const CostumListTile(
      {super.key, required this.title, required this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onPress,
        trailing: Icon(
          UIcons.regularStraight.angle_right,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
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
