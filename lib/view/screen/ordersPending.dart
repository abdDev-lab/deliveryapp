import 'package:deliveryapp/controller/pendingordersController.dart';
import 'package:deliveryapp/core/class/handlingdata.dart';
import 'package:deliveryapp/core/constant/appRoutes.dart';
import 'package:deliveryapp/view/widget/costum_titlePage.dart';
import 'package:deliveryapp/view/widget/ordersPageWidgets/costum_listTileOrdersPending.dart';
import 'package:deliveryapp/view/widget/ordersPageWidgets/costum_orderLocationDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PendingOrdersControllerImp>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              CostumTitlePage(title: "Pending Orders".tr),
              HandlingData(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        ...List.generate(
                            controller.ordersPending.length,
                            (index) => InkWell(
                                  onTap: () {
                                    controller.getOrderDirection(
                                        controller
                                            .ordersPending[index].ordersLocLat!,
                                        controller.ordersPending[index]
                                            .ordersLocLang!);
                                    Get.bottomSheet(CostumLocationDetails(
                                        ordersModel:
                                            controller.ordersPending[index],
                                        time: controller.time));
                                  },
                                  child: CostumListTileOrderPending(
                                    ordersModel:
                                        controller.ordersPending[index],
                                    image: controller.orderstatusimage(
                                        controller
                                            .ordersPending[index].ordersStatus!,
                                        controller.ordersPending[index]
                                            .ordersDeliverytype!),
                                  ),
                                ))
                      ],
                    ),
                  ),
                  pageroute: AppRoutes.home)
            ],
          ),
        ),
      ),
    );
  }
}
