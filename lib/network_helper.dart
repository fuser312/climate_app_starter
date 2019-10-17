import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  double latitude;
  double longitude;
  String cityName;
  String url;

  NetworkHelper({this.latitude, this.longitude, this.cityName}) {
    this.url = 'https://api.openweathermap.org/data/2.5/weather?q=${this.cityName}&appid=8d489d9f982ee92c12411dcb8a83fc13';
  }

  Future<Map> fetchWeatherInfo() async {
    Response response = await get(this.url);
    print(response.statusCode);
    print(response.body);
    Map weatherMap = jsonDecode(response.body);

    return weatherMap;
  }
}