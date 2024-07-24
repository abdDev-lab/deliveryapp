import 'package:deliveryapp/controller/settingsPageController.dart';
import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostummLogOutButton extends StatelessWidget {
  const CostummLogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsControllerImp>(
      builder: (controller) => Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 195, 195),
            borderRadius: BorderRadius.circular(30)),
        height: 50,
        child: MaterialButton(
            onPressed: () {
              Get.defaultDialog(
                  radius: 12,
                  contentPadding: const EdgeInsets.only(left: 16, right: 16),
                  title: "logout".tr,
                  content: Column(
                    children: [
                      Text(
                        "logoutbody".tr,
                        textAlign: TextAlign.center,
                      ),
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
                                controller.logout();
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
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "logout".tr,
                  style: const TextStyle(color: Colors.red , fontSize: 21 , fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 8,
                ),
                Icon(
                  UIcons.boldRounded.sign_out_alt,
                  color: Colors.red,
                  size: 21,
                )
              ],
            )),
      ),
    );
  }
}
