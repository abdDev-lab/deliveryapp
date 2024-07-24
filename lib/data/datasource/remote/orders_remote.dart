import 'package:deliveryapp/core/class/crud.dart';
import 'package:deliveryapp/core/constant/appLink.dart';

class OrdersData {
  Crud crud = Crud();

  OrdersData(this.crud);

  getData(String id) async {
    var response =
        await crud.postRequest(AppLink.orderslink, {"deliveryid": id});

    return response.fold((l) => l, (r) => r);
  }

  approveOrder(String id, String orderId, String userId) async {
    var response = await crud.postRequest(AppLink.approvelink,
        {"orderid": orderId, "userid": userId, "deliveryid": id});

    return response.fold((l) => l, (r) => r);
  }
  confrimRecievedOrder(String code, String orderId, String userId) async {
    var response = await crud.postRequest(AppLink.donelink,
        {"orderid": orderId, "userid": userId, "code": code});

    return response.fold((l) => l, (r) => r);
  }
}
