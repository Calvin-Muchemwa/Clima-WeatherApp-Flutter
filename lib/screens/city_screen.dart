import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(style: TextStyle(color: Colors.black),//Note how TextField was used for a searchBox
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,//Filling Colors
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                      hintText: 'Enter City Name',//Default text in searchBox (hintText)
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                  onChanged: (value){//value = current value in the TextField
                     cityName=value;
                  },
                ),
              ),
              FlatButton(
                onPressed: () {//now we have to pass the cityName over to previous screen

                  Navigator.pop(context,cityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
