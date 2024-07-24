import 'package:deliveryapp/core/class/crud.dart';

class LocationData {
  Crud crud = Crud();

  LocationData(this.crud);

  getData(
    point1latitude,
    point1longitude,
    point2latitude,
    point2longitude,
  ) async {
    var response = await crud.fetchRoute(
      point1latitude.toString(),
      point1longitude.toString(),
      point2latitude.toString(),
      point2longitude.toString(),
    );

    return response.fold((l) => l, (r) => r);
  }
}
