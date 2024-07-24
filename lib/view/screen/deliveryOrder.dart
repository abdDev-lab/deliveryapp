import 'package:deliveryapp/controller/deliveryOrderController.dart';
import 'package:deliveryapp/controller/pendingordersController.dart';
import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:deliveryapp/core/constant/appRoutes.dart';
import 'package:deliveryapp/view/widget/locationWidgets/costum_bottomLocationPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:uicons/uicons.dart';

class DeliveryOrder extends StatelessWidget {
  const DeliveryOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeliveryOrderContoller());

    return GetBuilder<DeliveryOrderContoller>(builder: (controller) {
      return Scaffold(
        //bottomNavigationBar: ,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height - 28,
                  child: Stack(
                    children: [
                      FlutterMap(
                        options: MapOptions(
                          initialCenter: LatLng(controller.userlatlocation!,
                              controller.userlanglocation!),
                          initialZoom: 15,
                          onMapReady: () {
                            controller.changevisiblebutton();
                          },
                        ),
                        children: [
                          TileLayer(
                            urlTemplate: Get.isDarkMode
                                ? controller.darkmodemap
                                : controller.lightmodemap,
                            additionalOptions: const {
                              'accessToken':
                                  'pk.eyJ1IjoiYWJkb3Vsb2MyNyIsImEiOiJjbHhvODI0YTgwYzhkMmtyMjAyZTB5MWJkIn0.ZpxA-NzmE_sEOULxV9MPbA'
                            },
                          ),
                          PolylineLayer(polylines: [
                            Polyline(
                              strokeWidth: 4,
                              color: AppColor.mainColor,
                              points: controller.routesPoint,
                            )
                          ]),
                          MarkerLayer(markers: [
                            Marker(
                                rotate: true,
                                point: LatLng(controller.officelatlocation,
                                    controller.officelanglocation),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  padding: const EdgeInsets.all(0.5),
                                  child: Icon(
                                    UIcons.solidRounded.box_alt,
                                    color: AppColor.mainColor,
                                    size: 19,
                                  ),
                                )
                                // child: Icon(
                                //   Icons.flag_circle_rounded,
                                //   color: Get.isDarkMode
                                // //       ? controller.marckerLocationColor
                                //       : AppColor.mainColor,
                                //   size: 30,
                                // )
                                ),
                            Marker(
                                rotate: true,
                                point: LatLng(
                                    controller.ordersModel!.ordersLocLat!,
                                    controller.ordersModel!.ordersLocLang!),
                                child: Icon(
                                  Icons.person_pin_circle_sharp,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : AppColor.mainColor,
                                  size: 30,
                                )),
                            controller.marker!
                          ])
                        ],
                      ),
                      Visibility(
                        visible: controller.backbuttonvisible,
                        child: Positioned(
                          left: 10,
                          child: IconButton(
                            onPressed: () {
                              Get.delete<PendingOrdersControllerImp>();
                              Get.put(PendingOrdersControllerImp());
                              Get.offNamed(AppRoutes.home);
                            },
                            icon: Icon(UIcons.regularRounded.angle_left),
                            color: Get.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        left: 0,
                        child: CostumBottomLocationPage(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
