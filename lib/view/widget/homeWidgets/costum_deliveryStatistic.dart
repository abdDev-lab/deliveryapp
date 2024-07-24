import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CostumDilveryStatistic extends StatelessWidget {
  final int totalamount;
  final int orderdelivered;
  final int ordernotdelivered;
  const CostumDilveryStatistic(
      {super.key,
      required this.totalamount,
      required this.orderdelivered,
      required this.ordernotdelivered});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 16, bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primary,
          boxShadow: Get.isDarkMode
              ? null
              : [
                  BoxShadow(
                      blurRadius: 8,
                      color: const Color.fromARGB(255, 217, 217, 217)
                          .withOpacity(0.5),
                      offset: const Offset(0, 0))
                ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.mainColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Total amount : ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    "\$ $totalamount",
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColor.secColor2,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "$orderdelivered",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        const Text(
                          "delivered ",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColor.secColor4,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "$ordernotdelivered",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                        const Text(
                          "not delivered ",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
