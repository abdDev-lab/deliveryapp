import 'dart:io';

import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      radius: 12,
      contentPadding: const EdgeInsets.only(left: 16, right: 16),
      title: "exitapp".tr,
      content: Column(
        children: [
          Text("exitappbody".tr),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: MaterialButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "cancel".tr,
                    style: const TextStyle(fontSize: 18 , color: Colors.black),
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.mainColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: MaterialButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text(
                    "yes".tr,
                    style: const TextStyle(color: Colors.white , fontSize: 18),
                  ),
                ),
              ),
            ],
          )
        ],
      ));
  return Future.value(true);
}
