// ignore_for_file: file_names

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDvtJDRdl-LRlF4UwPGSwbkB8I1aQ746Rg",
            appId: "1:74390462209:android:5e60df6703dab6e36f0500",
            messagingSenderId: "932275925874",
            projectId: "delivery-app-db8f1"));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}


initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
