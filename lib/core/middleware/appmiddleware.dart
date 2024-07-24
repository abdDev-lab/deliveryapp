import 'package:deliveryapp/core/constant/appRoutes.dart';
import 'package:deliveryapp/core/services/myServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppMiddleware extends GetMiddleware {
  MyServices myServices = Get.find();

  int? get periorty => 1;

  @override
  RouteSettings? redirect(route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.home);
    }

    return null;
  }
}
