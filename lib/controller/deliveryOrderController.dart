import 'dart:async';
import 'package:deliveryapp/core/class/handlingdata.dart';
import 'package:deliveryapp/core/class/statusrequest.dart';
import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:deliveryapp/core/constant/appRoutes.dart';
import 'package:deliveryapp/core/constant/appasset.dart';
import 'package:deliveryapp/core/functions/handlingdata.dart';
import 'package:deliveryapp/core/services/myServices.dart';
import 'package:deliveryapp/data/datasource/remote/location_remote.dart';
import 'package:deliveryapp/data/datasource/remote/orders_remote.dart';
import 'package:deliveryapp/data/model/orders_model.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart' as lottie;

class DeliveryOrderContoller extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  LocationData locationData = LocationData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest locationstatusRequest = StatusRequest.none;

  StreamSubscription<Position>? positionStream;
  Marker? marker;
  double? userlatlocation = 0;
  double? userlanglocation = 0;
  double officelatlocation = 36.190020;
  double officelanglocation = 5.440050;
  int deliverypostions = 0;
  OrdersModel? ordersModel;
  List courdinate = [];
  List<LatLng> routesPoint = [];
  double duration = 0;
  int time = 0;

  String darkmodemap =
      "https://api.mapbox.com/styles/v1/abdouloc27/clymrg5m5007i01pl8i2z6g87/tiles/256/{z}/{x}/{y}@2x?access_token=";
  String lightmodemap =
      "https://api.mapbox.com/styles/v1/abdouloc27/clxoeywkh00l101qrdynufsse/tiles/256/{z}/{x}/{y}@2x?access_token=";

  Map deliveryStatus = {
    0: "take the order from the office",
    1: "delivery the order to this location",
    2: "confirm order recieved",
  };
  Map deliveryPostionBotton = {
    0: "I took the order",
    1: "I delivered the order",
    2: "Finish"
  };
  bool backbuttonvisible = false;
  bool confirmCode = false;
  Color marckerLocationColor = Colors.white;

  @override
  void onInit() {
    getCurrentPosition();
    userlatlocation = myServices.sharedPreferences.getDouble("loc_lat");
    userlanglocation = myServices.sharedPreferences.getDouble("loc_long");

    ordersModel = Get.arguments["ordersmodel"];

    deliverypostions = myServices.sharedPreferences
        .getInt("deliverypostions${ordersModel!.ordersId}")!;
    marker = Marker(
        rotate: true,
        point: LatLng(userlatlocation!, userlanglocation!),
        child: Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          padding: const EdgeInsets.all(0.5),
          child: Icon(
            Icons.circle,
            color: AppColor.mainColor,
            size: 22,
          ),
        ));

    super.onInit();
  }

  changevisiblebutton() {
    backbuttonvisible = true;
    update();
  }

  confirmRecievedOrder(String code, int orderid, int userid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.confrimRecievedOrder(
        code, orderid.toString(), userid.toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        confirmCode = true;
        update();
        Get.back();
        Get.defaultDialog(
          barrierDismissible: false,
          title: "Confirm Order Recieved",
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              lottie.Lottie.asset(AppAsset.checked, repeat: false),
              Container(
                margin: const EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColor.mainColor,
                ),
                height: 55,
                child: MaterialButton(
                  onPressed: () {
                    Get.offNamed(AppRoutes.home);
                  },
                  child: const Text(
                    "Deliver another order!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
        deliverypostions++;
        myServices.sharedPreferences
            .setInt("deliverypostions$orderid", deliverypostions);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  changeDeliveryPostion() {
    if (deliverypostions == 2) {
      myServices.sharedPreferences
          .remove("deliverypostions${ordersModel!.ordersId}");
      Get.offNamed(AppRoutes.home);
    } else if (deliverypostions == 1) {
      Get.defaultDialog(
          barrierDismissible: false,
          title: "Enter Confrim Code",
          content: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.grey[800] : Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: HandlingDataForWidget(
                statusRequest: statusRequest,
                widget: OtpTextField(
                  textStyle: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                  cursorColor: Get.isDarkMode ? Colors.white : Colors.black,
                  numberOfFields: 5,
                  borderColor: AppColor.mainColor,
                  fillColor: Get.isDarkMode ? Colors.grey[800]! : Colors.white,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onSubmit: (String verificationCode) {
                    confirmRecievedOrder(verificationCode,
                        ordersModel!.ordersId!, ordersModel!.ordersUserid!);
                  }, // end onSubmit
                ),
              )));
    } else {
      deliverypostions++;
      myServices.sharedPreferences
          .setInt("deliverypostions${ordersModel!.ordersId}", deliverypostions);
    }

    update();
  }

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
      if (deliverypostions == 0) {
        getOfficeDirection(position.latitude, position.longitude);
      } else {
        getOrderDirection(position.latitude, position.longitude);
      }
      update();
    });
  }

  getOfficeDirection(double lat, double long) async {
    var response = await locationData.getData(
        officelatlocation, officelanglocation, lat, long);
    locationstatusRequest = handlingdata(response);
    if (StatusRequest.success == locationstatusRequest) {
      routesPoint.clear();
      courdinate = response['features'][0]['geometry']['coordinates'];
      duration =
          response['features'][0]['properties']['segments'][0]['duration'];

      routesPoint = courdinate.map((e) => LatLng(e[1], e[0])).toList();
      time = duration ~/ 60;
      marckerLocationColor = AppColor.mainColor;
    } else {
      locationstatusRequest = StatusRequest.failure;
    }
    update();
  }

  getOrderDirection(double lat, double lang) async {
    var response = await locationData.getData(
        lat, lang, ordersModel!.ordersLocLat, ordersModel!.ordersLocLang);
    locationstatusRequest = handlingdata(response);
    if (StatusRequest.success == locationstatusRequest) {
      routesPoint.clear();
      courdinate = response['features'][0]['geometry']['coordinates'];
      duration =
          response['features'][0]['properties']['segments'][0]['duration'];

      routesPoint = courdinate.map((e) => LatLng(e[1], e[0])).toList();
      time = duration ~/ 60;
    } else {
      locationstatusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onClose() {
    positionStream!.cancel();
    super.onClose();
  }
}
