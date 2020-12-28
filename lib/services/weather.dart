import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String openWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather';
const String api_key = "ENTERAPIKEYHERE";

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$api_key&units=metric';
    NetworkHelper networkHelper = await NetworkHelper(url);
    var jsonDecodedData = networkHelper.getData();
    return jsonDecodedData;
  }

  Future<dynamic> getLocationWeather() async {
    Location locationObject = Location();
    await locationObject.getCurrentLocation();
    String latitude = locationObject.latitude.toString();
    String longitude = locationObject.longitude.toString();
    String url =
        '$openWeatherMapURL?lat=$latitude&lon=$longitude&appid=$api_key&units=metric';
    NetworkHelper networkHelper = await NetworkHelper(url);
    var jsonDecodedData = networkHelper.getData();
    return jsonDecodedData;
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
