import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumListTileOrder extends StatelessWidget {
  final int orderid;
  final double orderprice;
  final String paymentMethod;
  final String image;

  const CostumListTileOrder(
      {super.key,
      required this.orderid,
      required this.orderprice,
      required this.paymentMethod,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(5),
      height: 130,
      decoration: BoxDecoration(
        boxShadow: Get.isDarkMode
            ? null
            : [
                BoxShadow(
                    blurRadius: 8,
                    color: const Color.fromARGB(255, 217, 217, 217)
                        .withOpacity(0.5),
                    offset: const Offset(0, 0))
              ],
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 110,
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              image,
              width: 90,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID $orderid"),
                    Row(
                      children: [
                        Text(
                          "price".tr,
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        Text("$orderprice\$",
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "paymentmethod".tr,
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                              height: 1),
                        ),
                        Text(paymentMethod,
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                height: 1)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
