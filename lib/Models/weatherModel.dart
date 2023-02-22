import 'package:flutter/material.dart';

class WeatherModel {
  String city;
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String condition;

  var hoursModel;
  var daysModel;

  //default constructor
  WeatherModel({
    required this.city,
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.hoursModel,
    required this.daysModel,
  });

  //named constructor
  // WeatherModel.fromJason(json) {
  //   var jsonData = json['forecast']['forecastday'][0]['day'];
  //   date = json['location']['localtime'];
  //   temp = jsonData['avgtemp_c'];
  //   maxTemp = jsonData['maxtemp_c'];
  //   minTemp = jsonData['mintemp_c'];
  //   condition = jsonData['condition']['text'];
  // }

  //factory constructor
  factory WeatherModel.fromJason(json) {
    var jsonData = json['forecast']['forecastday'][0]['day'];
    var jsonHData = json['forecast']['forecastday'][0]['hour'];
    return WeatherModel(
        city: json['location']['name'],
        date: json['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        condition: jsonData['condition']['text'],
        hoursModel: jsonHData,
        daysModel: json['forecast']['forecastday']);
  }
  @override
  String toString() {
    return "date = $date , temp = $temp , maxTemp = $maxTemp , minTemp = $minTemp , condition = $condition ";
  }

  getImage() {
    if (condition == "Sunny") {
      return "assets/images/real/Asset 11.png";
    } else if (condition == "Partly cloudy" ||
        condition == "Partly Cloudy" ||
        condition == "Overcast" ||
        condition == "Mist" ||
        condition == "Fog" ||
        condition == "Mist" ||
        condition == "Mist") {
      return "assets/images/real/Asset 7.png";
    } else if (condition == "Patchy rain nearby" ||
        condition == "Patchy light drizzle" ||
        condition == "Light drizzle" ||
        condition == "Freezing drizzle") {
      return "assets/images/real/Asset 11.png";
    } else if (condition == "Patchy snow nearby" ||
        condition == "Patchy sleet nearby" ||
        condition == "Patchy freezing drizzle nearby" ||
        condition == "Blowing snow" ||
        condition == "Blizzard" ||
        condition == "Freezing fog") {
      return "assets/images/real/Asset 13.png";
    } else if (condition == "Thundery outbreaks in nearby" ||
        condition == "Patchy freezing drizzle nearby") {
      return "assets/images/thunderstorm.png";
    } else {
      return "assets/images/real/Asset 6.png";
    }
  }

  getColor() {
    if (condition == "Sunny") {
      return Colors.orange;
    } else if (condition == "Partly Cloudy" ||
        condition == "Partly Cloudy" ||
        condition == "Overcast" ||
        condition == "Mist" ||
        condition == "Fog" ||
        condition == "Mist" ||
        condition == "Mist") {
      return Colors.grey;
    } else if (condition == "Patchy rain nearby" ||
        condition == "Patchy light drizzle" ||
        condition == "Light drizzle" ||
        condition == "Freezing drizzle") {
      return Colors.blue;
    } else if (condition == "Patchy snow nearby" ||
        condition == "Patchy sleet nearby" ||
        condition == "Patchy freezing drizzle nearby" ||
        condition == "Blowing snow" ||
        condition == "Blizzard" ||
        condition == "Freezing fog") {
      return Colors.white;
    } else if (condition == "Thundery outbreaks in nearby" ||
        condition == "Patchy freezing drizzle nearby") {
      return "assets/images/thunderstorm.png";
    } else {
      return Colors.blue;
    }
  }
}
