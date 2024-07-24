// ignore_for_file: file_names

import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';

class CostumButtonAuth extends StatelessWidget {
  final String buttonTitle;
  final void Function()? onPressed;
  const CostumButtonAuth(
      {super.key, required this.buttonTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 60,
      decoration: BoxDecoration(
          color: AppColor.mainColor, borderRadius: BorderRadius.circular(30)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonTitle,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
