import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';

class hou extends StatefulWidget {
  const hou({super.key});

  @override
  State<hou> createState() => _houState();
}

class _houState extends State<hou> {
  @override
  WeatherModel? HoursData;
  DateTime? time;
  double? htemp;
  String? icon;
  @override
  Widget build(BuildContext context) {
    HoursData = Provider.of<WeatherProvider?>(context)?.weatherData;

    return Container(
      height: 110,
      child: ListView.builder(
        itemCount: 24,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          time = DateTime.parse(HoursData?.hoursModel![index]['time']);
          htemp = HoursData?.hoursModel![index]['temp_c'];
          icon = HoursData?.hoursModel![index]['condition']['icon'];
          return Container(
            height: 100,
            child: Column(children: [
              Text(DateFormat('h:mm a').format(time!),
                  style: TextStyle(color: Colors.white)),
              Container(
                height: 70,
                child: Image.network("http:$icon"),
              ),
              Text("${htemp!.toInt().ceil()}°C", style: TextStyle(color: Colors.white))
            ]),
          );
        },
      ),
    );
  }
}
