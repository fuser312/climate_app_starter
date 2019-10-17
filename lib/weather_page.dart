import 'package:flutter/material.dart';


class WeatherPage extends StatefulWidget {
  Map weatherMap;

  WeatherPage({this.weatherMap});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/weather1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.location_city,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${(widget.weatherMap['main']['temp_max']-273).toStringAsFixed(1)}°',
                      style: TextStyle(
                        fontFamily: 'Spartan',
                        fontSize: 64,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '☀️',
                      style: TextStyle(
                        fontSize: 64,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16),
                child: Text(
                  "It's 🍦 time in ${widget.weatherMap['name']}!",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Spartan',
                    fontSize: 56,
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