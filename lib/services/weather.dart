import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/city_screen.dart';

const apiKey = '05b467da51b9da5c7bd8987ad234a02c';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityname) async {
    var url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    //print(location.latitude);
    //print(location.longitude);

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=Jaipur&appid=$apiKey&units=metric');
//&units=metric to convert in celsius
    //print(data); //response.body contain weather information of all the city or state

    var weatherData = await networkHelper.getData();
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
