import 'location.dart';
import 'package:clima/services/networking.dart';
import 'package:geolocator/geolocator.dart';
class WeatherModel {
  double latitude;
  double longitude;


  Future<dynamic> getLocationWeather() async{
    Location loc = Location();
    await loc.getCurrentLocation();
    latitude=loc.latitude;
    longitude=loc.longitude;
    NetworkHelper nhelper=NetworkHelper(url:'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=9bf122f7b64dd56a0e50bf4ec6e9c84f&units=metric');
    var weatherData=await nhelper.getData();//var is dynamic
     return weatherData;
  }


  Future<dynamic> getCityWeather(String cityname)async{
    NetworkHelper networkHelper=NetworkHelper(url:'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=9bf122f7b64dd56a0e50bf4ec6e9c84f&units=metric');
    var weatherData=await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
