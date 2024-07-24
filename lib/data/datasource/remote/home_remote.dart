import 'package:deliveryapp/core/class/crud.dart';
import 'package:deliveryapp/core/constant/appLink.dart';

class Homedata {
  Crud crud = Crud();

  Homedata(this.crud);

  getData(String id) async {
    var response = await crud.postRequest(AppLink.homelink, {"deliveryid": id});

    return response.fold((l) => l, (r) => r);
  }
   


}
