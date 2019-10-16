import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'location_page.dart';

class WeatherPage extends StatefulWidget {
  final Map weatherData;
  WeatherPage({this.weatherData});
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      fontSize: 48,
      color: Colors.white,
      fontWeight: FontWeight.bold,

    );
    Map weatherMap = widget.weatherData;
    double maxTempK = weatherMap['main']['temp_max'];
    double maxTempC = maxTempK - 273;
    String maxTempFinal = maxTempC.toStringAsFixed(0);
    String cityName = weatherMap['name'];

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
            image: DecorationImage(
              image : AssetImage('assets/weather1.jpg'),
              fit: BoxFit.fill,
            )

        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed:(){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.near_me,
                        color: Colors.white,
                        size: 32,),
                    ),
                    FlatButton(
                      onPressed: (){},
                      child: Icon(Icons.location_city,
                        color: Colors.white,
                        size: 32,),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Row(
                  children: <Widget>[
                    Text ( "$maxTempFinal \u00b0 ",
                      textAlign: TextAlign.left,
                      style: style,
                    ),
                    Text ( "☀️",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 48
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Wrap(
                  children: <Widget>[
                    Text ('Its 🍦 time in $cityName !',
                      style: style,
                      textAlign: TextAlign.right,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
