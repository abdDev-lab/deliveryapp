import 'package:deliveryapp/core/class/statusrequest.dart';
import 'package:deliveryapp/core/functions/handlingdata.dart';
import 'package:deliveryapp/core/services/myServices.dart';
import 'package:deliveryapp/data/datasource/remote/notifications_remote.dart';
import 'package:deliveryapp/data/model/notifications_model.dart';
import 'package:get/get.dart';

class NotificationsPageController extends GetxController {
  NotificationsData notificationsData = NotificationsData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  List<NotificationsModel> data = [];

  @override
  void onInit() {
    getData();

    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationsData
        .getData(myServices.sharedPreferences.getInt("id").toString());
    statusRequest = handlingdata(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsedata = response["data"];
        data.addAll(responsedata.map((e) => NotificationsModel.fromJson(e)));
        readNotification();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  readNotification() async {
    var response = await notificationsData.readNotifications(
        myServices.sharedPreferences.getInt("id").toString());
    return response;
  }
}
