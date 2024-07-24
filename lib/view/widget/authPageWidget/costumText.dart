// ignore_for_file: file_names

import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';

class CostumText extends StatelessWidget {
  final String text;
  final String namepage;
  final void Function()? onPressed;
  const CostumText(
      {super.key, required this.text, required this.namepage, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontFamily: "Poppins", color: Colors.black),
        ),
        TextButton(
            onPressed: onPressed,
            child: Text(
              namepage,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15,
                  color: AppColor.mainColor),
            )),
      ],
    );
  }
}
