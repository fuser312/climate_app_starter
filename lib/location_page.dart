import 'dart:convert';

import "weather_page.dart";
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'main.dart';
import 'package:http/http.dart';
import 'weather_page.dart';



class LocationPage extends StatefulWidget {


  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Future<Position> geLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
    return position;
  }

  Future<Map> fetchWeatherInfo(double lat, double long) async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=8d489d9f982ee92c12411dcb8a83fc13');
    if (response.statusCode == 200) {
      print("response 200");
    }
    Map<String, dynamic> weatherDataMap = jsonDecode(response.body);
    return weatherDataMap;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                image : AssetImage('assets/weather.jpg'),
                fit: BoxFit.fill,
              )
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                  height: 120
              ),
              FlatButton(
                onPressed: () async {
                  Position myPosition = await geLocation();
                  print("myposition is $myPosition");
                  //variable gatheredData will wait for fetchData to finish and then get its value.
                  Map gatheredData = await fetchWeatherInfo(
                      myPosition.latitude, myPosition.longitude);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WeatherPage()));
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
                color: Colors.blue.withAlpha(0),),
            ],
          ),
        ),
      ),
    );
  }
}
