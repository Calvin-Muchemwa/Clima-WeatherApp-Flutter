import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationweather});

  final locationweather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String caption;

  @override
  void initState() {
    //as soon as screen initiates this is what i want to do
    super.initState();
    updateUI(widget
        .locationweather); //we use widget. inorder to tap into location weather which os passed to the location weather stateful widget from loading screen
  }

  void updateUI(dynamic weatherData) {
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    weatherIcon = weather.getWeatherIcon(condition);
    caption = weather.getMessage(temperature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.8), BlendMode.dstATop),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
               // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          var weatherData = await weather.getLocationWeather();
                          setState(() {
                            updateUI(weatherData);
                          });

                        },
                        child: Icon(
                          Icons.near_me,
                          size: 40.0,
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return CityScreen();
                            }),
                          );
                         print('typed name is $typedName');

                          if (typedName != null) {
                            print('before wait');
                            var weatherData = await weather.getCityWeather(typedName);
                            print('weatherdata update is $weatherData');

                            setState(() {
                              updateUI(weatherData);
                            });


                          }


                        },
                        child: Icon(
                          Icons.location_city,
                          size: 50.0,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '$temperature°',
                          style: kTempTextStyle,
                        ),
                        Text(
                          '$weatherIcon',
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "$caption in $cityName",
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                  ),
                ],
              ),

          ),
        ),

    );
  }
}
