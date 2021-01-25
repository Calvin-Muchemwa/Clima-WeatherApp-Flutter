import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class Location{
  double _latitude,_longitude;

  get longitude => _longitude;

  get latitude => _latitude;

  Future<void>getCurrentLocation()async{
    try {
      //async is a modifier,we use this when we implementing time comsuming tasks so it happens in the background instead of freezing our App
      //Asynchronous Programming helps coz we dont have to wait on the data to load for it to contiunue to the nextLine of execution this saves us alot of time.
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _latitude=position.latitude;
      _longitude=position.longitude;




    }catch(e){
      print(e);
    }
  }

}