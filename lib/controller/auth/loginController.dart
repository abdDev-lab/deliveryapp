// ignore_for_file: file_names

import 'package:deliveryapp/core/class/statusrequest.dart';
import 'package:deliveryapp/core/constant/appRoutes.dart';
import 'package:deliveryapp/core/functions/handlingdata.dart';
import 'package:deliveryapp/core/services/myServices.dart';
import 'package:deliveryapp/data/datasource/remote/auth/login_remote.dart';
import 'package:deliveryapp/view/widget/locationWidgets/locationPermission.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uicons/uicons.dart';

abstract class LoginController extends GetxController {
  login();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late bool isvisible = true;
  late IconData lockicon = UIcons.regularRounded.lock;
  isVisible() {
    isvisible = !isvisible;
    lockicon = isvisible == false
        ? UIcons.regularRounded.unlock
        : UIcons.regularRounded.lock;
    update();
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingdata(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences
              .setInt("id", response['data']['delivery_id']);
          myServices.sharedPreferences
              .setString("username", response['data']['delivery_name']);
          myServices.sharedPreferences
              .setString("email", response['data']['delivery_email']);
          myServices.sharedPreferences
              .setInt("phone", response['data']['delivery_phone']);

          myServices.sharedPreferences.setString("step", "2");
          determinePosition();
          FirebaseMessaging.instance.subscribeToTopic("delivery");
          FirebaseMessaging.instance.subscribeToTopic(
              "delivery${myServices.sharedPreferences.getInt("id")}");

          Get.offNamed(AppRoutes.home);
        } else if (response['status'] == "wrong_password") {
          Get.defaultDialog(
            title: "Fail Login",
            content: const Text("wrong password"),
          );
          statusRequest = StatusRequest.failure;
        } else {
          Get.defaultDialog(
            title: "Fail Login",
            content: const Text("there no delivery with this email"),
          );
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }
}
