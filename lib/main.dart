import 'package:flutter/material.dart';
import 'package:weather_app/Components/search.dart';
import 'package:weather_app/Pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/pages/Search_Page.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(), child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: TextTheme(), primaryColor: Colors.white
          // Provider.of<WeatherProvider>(context)
          //             .weatherData
          //             ?.getColor() ==
          //         null
          //     ? Colors.blue
          //     : Provider.of<WeatherProvider>(context).weatherData!.getColor()
          ),
      home: HomePage(),
      routes: {"Search": (context) => search()},
    );
  }
}
