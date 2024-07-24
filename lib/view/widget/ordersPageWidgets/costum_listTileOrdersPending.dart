import 'package:deliveryapp/controller/pendingordersController.dart';
import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:deliveryapp/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CostumListTileOrderPending extends StatelessWidget {
  final OrdersModel ordersModel;
  final String image;
  const CostumListTileOrderPending({
    super.key,
    required this.ordersModel,
    required this.image,
  });

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
              
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ID ${ordersModel.ordersId}"),
                  Row(
                    children: [
                      Text(
                        "Price : ",
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                            height: 1),
                      ),
                      Text("${ordersModel.ordersPrice}\$",
                          style: TextStyle(
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black)),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Method : ",
                        style: TextStyle(
                            color:
                                Get.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w600,
                            height: 1),
                      ),
                      Text(
                          ordersModel.ordersPaymentmethod == 0
                              ? "cash"
                              : "credit card",
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
          const SizedBox(
            width: 60,
          ),
          GetBuilder<PendingOrdersControllerImp>(
              builder: (controller) => AnimatedBuilder(
                    animation: controller.opacityAnimation,
                    builder: (context, child) => Opacity(
                        opacity: controller.opacityAnimation.value,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.mainColor),
                        )),
                  )),
        ],
      ),
    );
  }
}
