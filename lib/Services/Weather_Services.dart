import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weatherModel.dart';

class weatherService {
  String apiKey = "297bd7d2300c4c3e932162900231701";
  String baseUrl = "http://api.weatherapi.com/v1";
  WeatherModel? jData;
  Future<WeatherModel?> getWeather(String city) async {
    try {
      Uri url = Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$city&days=4");
      http.Response response = await http.get(url);

      //الجيسون دا ستراكشر معين انا بحول السترنج ليه عشان اقدر اتعامل مع السترنج دا واستخدمو بسهوله
      //فنكشن الجيسون ديكود بتحول البيانات لشكل جيسون
      // البيانات الي راجعه ماب والكي نوعو سترينج اما الفاليو متغيره فا خليناها دينامك

      Map<String, dynamic> data = jsonDecode(response.body);

      /////////////////////////////////
      jData = WeatherModel.fromJason(data);
      return jData;
    } catch (e) {
      print(e);
    }
  }
}
