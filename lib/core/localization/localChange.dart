// ignore_for_file: file_names

import 'package:deliveryapp/core/functions/fcmconfig.dart';
import 'package:deliveryapp/core/services/myServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalChange extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  changeLang(String langcode) {
    Locale locale = Locale(langcode);

    myServices.sharedPreferences.setString("lang", langcode);

    Get.updateLocale(locale);
    language = Locale(langcode);

    update();
  }

  @override
  void onInit() {
    requestPermissonNotification();

    if (myServices.sharedPreferences.getString("lang") == "ar") {
      language = const Locale("ar");
    } else if (myServices.sharedPreferences.getString("lang") == "en") {
      language = const Locale("en");
    } else {
      // myServices.sharedPreferences
      //     .setString("lang", Get.deviceLocale!.languageCode);
      language = Locale(Get.deviceLocale!.languageCode);
    }
    if (myServices.sharedPreferences.getString("theme") != null) {
      if (myServices.sharedPreferences.getString("theme") == "dark") {
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        Get.changeThemeMode(ThemeMode.light);
        myServices.sharedPreferences.setString("theme", "light");
      }
    } else {
      Get.changeThemeMode(ThemeMode.system);
    }
    super.onInit();
  }
}
