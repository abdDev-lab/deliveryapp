import 'package:deliveryapp/controller/homePageController.dart';
import 'package:deliveryapp/core/class/handlingdata.dart';

import 'package:deliveryapp/view/widget/homeWidgets/costum_deliveryStatistic.dart';
import 'package:deliveryapp/view/widget/homeWidgets/costum_listTileOrdersAccepted.dart';
import 'package:deliveryapp/view/widget/homeWidgets/costumhead.dart';
import 'package:deliveryapp/view/widget/homeWidgets/costumsubtitle.dart';
import 'package:deliveryapp/view/widget/ordersPageWidgets/costum_listTileOrder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.only(left: 16, right: 16),
            children: [
              const CostumHeadHome(),
              HandlingDataShimmerView(
                statusRequest: controller.deliveryStaticStatutsRequest,
                widget: CostumDilveryStatistic(
                    totalamount: controller.totalamount,
                    orderdelivered: controller.ordersDelivered,
                    ordernotdelivered: controller.ordersNotDelivered),
              ),
              const CostumSubTitle(
                title: "Orders Accepted",
              ),
              HandlingDataForWidget(
                statusRequest: controller.ordersAccppetedStatutsRequest,
                widget: Column(
                  children: [
                    ...List.generate(
                        controller.ordersAcceptedList.length,
                        (index) => CostumListTileOrderAccepted(
                              ordersModel: controller.ordersAcceptedList[index],
                              image: controller.orderstatusimage(
                                  controller
                                      .ordersAcceptedList[index].ordersStatus!,
                                  controller.ordersAcceptedList[index]
                                      .ordersDeliverytype!),
                            )),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
              const CostumSubTitle(
                title: "Orders Delivered",
              ),
              HandlingDataForWidget(
                statusRequest: controller.ordersDeliveredStatutsRequest,
                widget: Column(
                  children: [
                    ...List.generate(
                        controller.ordersDeliveredList.length,
                        (index) => CostumListTileOrder(
                              orderid: controller
                                  .ordersDeliveredList[index].ordersId!,
                              orderprice: controller
                                  .ordersDeliveredList[index].ordersPrice!,
                              paymentMethod: controller
                                          .ordersDeliveredList[index]
                                          .ordersPaymentmethod ==
                                      0
                                  ? "cash".tr
                                  : "creditcard".tr,
                              image: controller.orderstatusimage(
                                  controller
                                      .ordersDeliveredList[index].ordersStatus!,
                                  controller.ordersDeliveredList[index]
                                      .ordersDeliverytype!),
                            )),
                    const SizedBox(
                      height: 16,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
