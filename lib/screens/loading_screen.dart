
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {//State = current state of the screen

  double latitude;
  double longitude;
  String urls;


  void getLocationData() async {
  WeatherModel weathermodel=WeatherModel();
  var weatherData= await weathermodel.getLocationWeather(); //var is known as type dynamic
    Navigator.push(context, MaterialPageRoute(builder:(context){
      return LocationScreen(locationweather: weatherData,);
    }));
  }




@override
  void initState() {//init state gets called as soon as  Widget created its the first in the Widget LifeCycle
    super.initState();
     getLocationData();

  }


  @override
  Widget build(BuildContext context) { //Build widget is called everytime we run our App inorder to rebuild any new Widgets required

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(//loading icon on loading screen
          color: Colors.white,
          size: 100,
        ),
      )
    );

  }

}
