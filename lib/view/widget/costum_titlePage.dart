// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumTitlePage extends StatelessWidget {
  final String title;
  const CostumTitlePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 24),
          child: Text(
            title,
            style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 26),
          ),
        ),
      ],
    );
  }
}
