import 'package:deliveryapp/core/constant/appColor.dart';
import 'package:deliveryapp/core/services/myServices.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  MyServices myServices = Get.find();
  double? userlatlocation = 0;
  double? userlanglocation = 0;
  String? userCountry;
  String? userStreet;
  String? userCity;
  String darkmodemap =
      "https://api.mapbox.com/styles/v1/abdouloc27/clymrg5m5007i01pl8i2z6g87/tiles/256/{z}/{x}/{y}@2x?access_token=";
  String lightmodemap =
      "https://api.mapbox.com/styles/v1/abdouloc27/clxoeywkh00l101qrdynufsse/tiles/256/{z}/{x}/{y}@2x?access_token=";
  double? lat = 0;
  double? lang = 0;

  @override
  void onInit() {
    userlatlocation = myServices.sharedPreferences.getDouble("loc_lat");
    userlanglocation = myServices.sharedPreferences.getDouble("loc_long");
    getLocationInfo();
    super.onInit();
  }

  getLocationInfo() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(userlatlocation!, userlanglocation!);
    userCountry = placemarks[0].country;
    userStreet = placemarks[0].street;
    userCity = placemarks[0].locality;
    update();
  }

  locationUpdate(double ontaplat, double ontaplang) {
    lat = ontaplat;
    lang = ontaplang;
    update();
  }

  locationUserUpdate() {
    myServices.sharedPreferences.setDouble("loc_lat", lat!);
    myServices.sharedPreferences.setDouble("loc_long", lang!);
    userlatlocation = myServices.sharedPreferences.getDouble("loc_lat");
    userlanglocation = myServices.sharedPreferences.getDouble("loc_long");
    getLocationInfo();
    lat = 0;
    lang = 0;
    update();
  }

  confirmLocation() {
    if (lat != 0 || lang != 0) {
      Get.defaultDialog(
          radius: 12,
          contentPadding: const EdgeInsets.only(left: 16, right: 16),
          title: "Location",
          content: Column(
            children: [
              const Text(
                "Do you went to change your location ?",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        locationUserUpdate();
                        Get.back();
                      },
                      child: const Text(
                        "Yes",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ));
    } else {
      Get.back();
    }
  }
}
