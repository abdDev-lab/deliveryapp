// ignore_for_file: file_names

import 'package:deliveryapp/core/class/statusrequest.dart';
import 'package:deliveryapp/core/constant/appasset.dart';
import 'package:deliveryapp/core/functions/handlingdata.dart';
import 'package:deliveryapp/core/services/myServices.dart';
import 'package:deliveryapp/data/datasource/remote/home_remote.dart';
import 'package:deliveryapp/data/model/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  Homedata homedata = Homedata(Get.find());
  AnimationController? animationController;
  Animation<double>? opacityAnimation;
  List<OrdersModel> ordersDeliveredList = [];
  List<OrdersModel> ordersAcceptedList = [];

  int totalamount = 0;
  int ordersDelivered = 0;
  int ordersNotDelivered = 0;
  StatusRequest statusRequest = StatusRequest.loading;
  StatusRequest deliveryStaticStatutsRequest = StatusRequest.loading;
  StatusRequest ordersAccppetedStatutsRequest = StatusRequest.loading;
  StatusRequest ordersDeliveredStatutsRequest = StatusRequest.loading;

  @override
  void onInit() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(animationController!);
    getData();
    super.onInit();
  }

  @override
  getData() async {
    deliveryStaticStatutsRequest = StatusRequest.loading;
    ordersAccppetedStatutsRequest = StatusRequest.loading;
    ordersDeliveredStatutsRequest = StatusRequest.loading;
    update();
    var response = await homedata
        .getData(myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        totalamount = response["data"]["deliveryStatic"][0]["totalamount"];
        ordersDelivered =
            response["data"]["deliveryStatic"][0]["ordersdelivered"];
        ordersNotDelivered =
            response["data"]["deliveryStatic"][0]["ordernotdelivered"];
        deliveryStaticStatutsRequest = StatusRequest.success;
        update();
        if (response["data"]["orders_accepted"] != 0) {
          List responseordersaccepted = response["data"]["orders_accepted"];

          ordersAcceptedList.addAll(responseordersaccepted.reversed
              .map((e) => OrdersModel.fromJson(e)));

          ordersAccppetedStatutsRequest = StatusRequest.success;
        } else {
          ordersAccppetedStatutsRequest = StatusRequest.failure;
          ordersAcceptedList = [];
        }
        update();
        if (response["data"]["orderes_delivered"] != 0) {
          List responseordersdelivered = response["data"]["orderes_delivered"];
          ordersDeliveredList.addAll(responseordersdelivered.reversed
              .map((e) => OrdersModel.fromJson(e)));
          ordersDeliveredStatutsRequest = StatusRequest.success;
        } else {
          ordersDeliveredStatutsRequest = StatusRequest.failure;
          ordersDeliveredList = [];
        }
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String orderstatusimage(int orderstatus, int deliverytype) {
    if (orderstatus == 4) {
      return AppAsset.orderwaiting;
    } else {
      return AppAsset.orderconfirm;
    }
  }

  @override
  void onClose() {
    animationController!.dispose();
    super.onClose();
  }
}
