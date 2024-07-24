import 'package:deliveryapp/controller/pendingordersController.dart';
import 'package:deliveryapp/core/class/handlingdata.dart';
import 'package:deliveryapp/core/class/statusrequest.dart';
import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:deliveryapp/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:uicons/uicons.dart';

class CostumLocationDetails extends StatelessWidget {
  final OrdersModel ordersModel;
  final int time;
  const CostumLocationDetails(
      {super.key, required this.ordersModel, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        height: 600,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        child: GetBuilder<PendingOrdersControllerImp>(builder: (controller) {
          return HandlingDataForWidget(
            statusRequest: controller.locationstatusRequest,
            widget: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: FlutterMap(
                    options: MapOptions(
                      initialCameraFit: CameraFit.bounds(
                          padding: const EdgeInsets.all(60),
                          bounds: LatLngBounds.fromPoints([
                            const LatLng(36.19002, 5.44005),
                            LatLng(ordersModel.ordersLocLat!,
                                ordersModel.ordersLocLang!),
                          ])),
                      interactionOptions:
                          const InteractionOptions(flags: InteractiveFlag.none),
                      // LatLng(ordersModel.ordersLocLat!,
                      //     ordersModel.ordersLocLang!),
                      initialZoom: 15,
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
                                shape: BoxShape.circle, color: Colors.white),
                            child: Icon(
                              UIcons.solidRounded.box_alt,
                              color: AppColor.mainColor,
                              size: 15,
                            ),
                          ),
                        ),
                        Marker(
                            rotate: true,
                            point: LatLng(ordersModel.ordersLocLat!,
                                ordersModel.ordersLocLang!),
                            child: Icon(
                              Icons.person_pin_circle_sharp,
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : AppColor.mainColor,
                              size: 30,
                            )),
                      ])
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "ID ${ordersModel.ordersId}",
                      style: const TextStyle(fontSize: 26),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Price : ",
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1),
                        ),
                        Text("${ordersModel.ordersPrice}\$",
                            style: TextStyle(
                                fontSize: 20,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Payment Method : ",
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              height: 1),
                        ),
                        Text(
                            ordersModel.ordersPaymentmethod == 0
                                ? "cash"
                                : "credit card",
                            style: TextStyle(
                                fontSize: 20,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                height: 1)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${controller.time} min",
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.red),
                        child: MaterialButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.green),
                        child: MaterialButton(
                          onPressed: () {
                            controller.approveOrder(ordersModel);
                          },
                          child: controller.approvestatusRequest ==
                                  StatusRequest.loading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "Accept",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }));
  }
}
