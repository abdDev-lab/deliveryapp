// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:deliveryapp/core/constant/appLink.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumAccountCard extends StatelessWidget {
  final String username;
  final String email;
  final String image;
  const CostumAccountCard(
      {super.key,
      required this.username,
      required this.email,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "accountitle".tr,
          style: TextStyle(
              color: Get.isDarkMode ? Colors.white : Colors.black,
              fontSize: 21),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          padding:
              const EdgeInsets.only(left: 12, right: 15, top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12),
            //boxShadow: [
            //  BoxShadow(
            //      blurRadius: 8,
            //      color: const Color.fromARGB(255, 217, 217, 217)
            //          .withOpacity(0.5),
            //      offset: const Offset(0, 0))
            //]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Hero(
                    tag: "accountimg",
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage: CachedNetworkImageProvider(
                          "${AppLink.userimageslink}/$image",
                        )),
                  ),
                  Container(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          color: Get.isDarkMode
                              ? Colors.grey[300]
                              : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Icon(UIcons.regularStraight.angle_right)
            ],
          ),
        ),
      ],
    );
  }
}
