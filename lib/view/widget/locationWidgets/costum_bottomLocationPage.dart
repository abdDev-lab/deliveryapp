import 'package:deliveryapp/controller/deliveryOrderController.dart';
import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

class CostumBottomLocationPage extends StatelessWidget {
  const CostumBottomLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryOrderContoller>(
      builder: (controller) => Container(
          height: 280,
          width: Get.width,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("${controller.deliveryStatus[controller.deliverypostions]}"),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      3,
                      (index) => SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                index <= controller.deliverypostions
                                    ? Container(
                                        margin: const EdgeInsets.only(),
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.mainColor),
                                        child: Icon(
                                          UIcons.boldRounded.check,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      )
                                    : Container(
                                        margin: const EdgeInsets.only(left: 12),
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Get.isDarkMode
                                              ? Colors.grey[300]
                                              : Colors.grey[400],
                                        ),
                                      ),
                                index == 2
                                    ? Container()
                                    : index < controller.deliverypostions
                                        ? Container(
                                            margin: const EdgeInsets.only(),
                                            height: 3.5,
                                            width: 92,
                                            color: AppColor.mainColor,
                                          )
                                        : Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              ...List.generate(5, (index) {
                                                return Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 12),
                                                  height: 4,
                                                  width: 4,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Get.isDarkMode
                                                        ? Colors.grey[300]
                                                        : Colors.grey[600],
                                                  ),
                                                );
                                              }),
                                            ],
                                          )
                              ],
                            ),
                          ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ID ${controller.ordersModel!.ordersId}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Text(
                    "${controller.time} min",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.mainColor,
                ),
                width: 360,
                height: 55,
                child: MaterialButton(
                  onPressed: () {
                    controller.changeDeliveryPostion();
                  },
                  child: Text(
                    "${controller.deliveryPostionBotton[controller.deliverypostions]}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
