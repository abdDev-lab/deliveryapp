// ignore_for_file: file_names

import 'package:deliveryapp/controller/locationController.dart';
import 'package:deliveryapp/view/widget/locationWidgets/costum_bottomLocationPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:uicons/uicons.dart';
import 'package:deliveryapp/core/constant/appColor.dart';

class CostumMapFlutter extends StatelessWidget {
  const CostumMapFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());
    return GetBuilder<LocationController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: const CostumBottomLocationPage(),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              padding: const EdgeInsets.only(top: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "locationtitle".tr,
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 26),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height - 183,
              child: FlutterMap(
                options: MapOptions(
                  onTap: (tapPosition, point) async {
                    //List<Placemark> placemarks = await placemarkFromCoordinates(
                    //    point.latitude, point.longitude);
                    controller.locationUpdate(point.latitude, point.longitude);
                  },
                  initialCenter: LatLng(controller.userlatlocation!,
                      controller.userlanglocation!),
                  initialZoom: 15,
                ),
                children: [
                  TileLayer(
                    urlTemplate: Get.isDarkMode
                        ? controller.darkmodemap
                        : controller.lightmodemap,
                    additionalOptions: const {
                      'accessToken':
                          'pk.eyJ1IjoiYWJkb3Vsb2MyNyIsImEiOiJjbHhvZW40ajkwY2RzMmtzZTFqZXRiMnluIn0.9NgM-s1EOKQAhS-MLJBzwg'
                    },
                  ),
                  MarkerLayer(markers: [
                    Marker(
                        rotate: true,
                        point: LatLng(controller.userlatlocation!,
                            controller.userlanglocation!),
                        child: Icon(
                          UIcons.solidStraight.map_marker_home,
                          color: AppColor.mainColor,
                          size: 30,
                        )),
                    Marker(
                        rotate: true,
                        point: LatLng(controller.lat!, controller.lang!),
                        child: Icon(
                          UIcons.solidStraight.marker,
                          color: AppColor.mainColor,
                          size: 30,
                        )),
                  ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
