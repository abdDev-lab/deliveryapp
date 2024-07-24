import 'package:deliveryapp/controller/trackingController.dart';
import 'package:deliveryapp/core/class/statusrequest.dart';
import 'package:deliveryapp/core/constant/appRoutes.dart';

import 'package:deliveryapp/core/constant/appasset.dart';

import 'package:deliveryapp/core/functions/handlingdata.dart';
import 'package:deliveryapp/core/services/myServices.dart';
import 'package:deliveryapp/data/datasource/remote/location_remote.dart';
import 'package:deliveryapp/data/datasource/remote/orders_remote.dart';
import 'package:deliveryapp/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

abstract class PendingOrdersController extends GetxController
    with GetSingleTickerProviderStateMixin {
  getData();
  approveOrder(OrdersModel ordersModel);
}

class PendingOrdersControllerImp extends PendingOrdersController {
  OrdersData ordersData = OrdersData(Get.find());
  LocationData locationData = LocationData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest locationstatusRequest = StatusRequest.none;
  StatusRequest approvestatusRequest = StatusRequest.none;
  String darkmodemap =
      "https://api.mapbox.com/styles/v1/abdouloc27/clymrg5m5007i01pl8i2z6g87/tiles/256/{z}/{x}/{y}@2x?access_token=";
  String lightmodemap =
      "https://api.mapbox.com/styles/v1/abdouloc27/clxoeywkh00l101qrdynufsse/tiles/256/{z}/{x}/{y}@2x?access_token=";
  double officelatlocation = 36.190020;
  double officelanglocation = 5.440050;
  double? orderLocationLat;
  double? orderLocationLong;
  double duration = 0;
  int time = 0;

  late AnimationController animationController;
  late Animation<double> opacityAnimation;
  List<OrdersModel> ordersPending = [];
  List courdinate = [];
  List<LatLng> routesPoint = [];
  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    update();
    getData();

    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData
        .getData(myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        ordersPending.addAll(responsedata.reversed.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  String orderstatusimage(int orderstatus, int deliverytype) {
    if (orderstatus == 3) {
      return AppAsset.orderwaiting;
    } else {
      return AppAsset.orderconfirm;
    }
  }

  @override
  approveOrder(OrdersModel ordersModel) async {
    approvestatusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.approveOrder(
        myServices.sharedPreferences.getInt("id").toString(),
        ordersModel.ordersId.toString(),
        ordersModel.ordersUserid.toString());
    approvestatusRequest = handlingdata(response);
    if (StatusRequest.success == approvestatusRequest) {
      if (response['status'] == "success") {
        Get.put(TrackingController());
        Get.toNamed(AppRoutes.deliveryorder,
            arguments: {"ordersmodel": ordersModel});
        myServices.sharedPreferences
            .setInt("deliverypostions${ordersModel.ordersId}", 0);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  getOrderDirection(double lat, double long) async {
    locationstatusRequest = StatusRequest.loading;
    update();
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
    } else {
      locationstatusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
