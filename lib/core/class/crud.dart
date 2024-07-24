import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:deliveryapp/core/functions/check_internet.dart';
import 'package:deliveryapp/core/class/statusrequest.dart';

import 'package:http/http.dart' as http;

class Crud {

  Future<Either<StatusRequest, Map>> postRequest(String link, Map data) async {
    try {
      if (await checkinternet()) {
        var response = await http.post(Uri.parse(link), body: data , headers: myheaders);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);

          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverfailure);
    }
  }

  Future<Either<StatusRequest, dynamic>> fetchRoute(
    String point1latitude,
    String point1longitude,
    String point2latitude,
    String point2longitude,
  ) async {
    final String url =
        'https://api.openrouteservice.org/v2/directions/driving-car?api_key=&start=$point1longitude,$point1latitude&end=$point2longitude,$point2latitude';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Right(data);
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
