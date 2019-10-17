import 'loading_screen.dart';
import 'package:climate_app/loading_screen.dart';
import 'package:climate_app/location.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  String cityName;
  @override
  _LocationPage createState() => _LocationPage();
}

class _LocationPage extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/weather.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16, top: 32),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(.5),
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 40,
                      ),
                      hintText: 'City Name Please',
                      hintStyle: TextStyle(color: Colors.black)),
                  onChanged: (String text) {
                    widget.cityName = text;
                  },
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => LoadingPage(cityName: widget.cityName,)));
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Spartan',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}