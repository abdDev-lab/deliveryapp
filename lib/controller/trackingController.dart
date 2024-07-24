import 'dart:async';

import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class TrackingController extends GetxController {
  StreamSubscription<Position>? positionStream;
  Marker? marker;

  getCurrentPosition() {
    positionStream =
        Geolocator.getPositionStream().listen((Position? position) {
      marker = Marker(
          rotate: true,
          point: LatLng(position!.latitude, position.longitude),
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            padding: const EdgeInsets.all(0.5),
            child: Icon(
              Icons.circle,
              color: AppColor.mainColor,
              size: 22,
            ),
          ));
      print(
          '${position.latitude.toString()}, ${position.longitude.toString()}');
    });
    update();
  }

  @override
  void onInit() {
    getCurrentPosition();
    super.onInit();
  }
}
