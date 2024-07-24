// ignore_for_file: file_names

import 'package:deliveryapp/core/services/myServices.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

Future<Position> determinePosition() async {
  MyServices myServices = Get.find();
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  if (permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always ||
      myServices.sharedPreferences.getDouble("loc_lat") == null ||
      myServices.sharedPreferences.getDouble("loc_long") == null) {
    Position position = await Geolocator.getCurrentPosition();
    myServices.sharedPreferences.setDouble("loc_lat", position.latitude);
    myServices.sharedPreferences.setDouble("loc_long", position.longitude);
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
