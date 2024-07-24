// ignore_for_file: file_names

import 'package:deliveryapp/core/class/crud.dart';
import 'package:deliveryapp/core/localization/localChange.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(LocalChange());
  }

}
