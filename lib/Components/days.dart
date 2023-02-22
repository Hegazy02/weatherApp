import 'package:flutter/material.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'package:intl/intl.dart';

class days extends StatefulWidget {
  const days({super.key});

  @override
  State<days> createState() => _houState();
}

class _houState extends State<days> {
  @override
  WeatherModel? daysData;

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    daysData = Provider.of<WeatherProvider?>(context)?.weatherData;
    var dData = daysData!.daysModel;

    int? numberoftheday;
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          numberoftheday = date.weekday + index + 1;
          double temp = dData[index]['day']['avgtemp_c'];
          String dIcon = dData[index]['day']['condition']['icon'];
          return Container(
              height: 70,
              child: Column(
                children: [
                  Row(children: [
                    Spacer(
                      flex: 1,
                    ),
                    Container(
                        width: 80,
                        child: Text(weekd(numberoftheday),
                            style: TextStyle(color: Colors.white))),
                    Spacer(
                      flex: 4,
                    ),
                    Container(
                        height: 40,
                        child: Image.network(
                          "http:$dIcon",
                        )),
                    Spacer(
                      flex: 3,
                    ),
                    Text("${temp.toInt().ceil()}°C",
                        style: TextStyle(color: Colors.white)),
                    Spacer(
                      flex: 1,
                    ),
                  ]),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Divider())
                ],
              ));
        },
      ),
    );
  }
}

weekd(day) {
  if (day == 1) {
    return "monday";
  } else if (day == 2) {
    return "tuesday";
  } else if (day == 3) {
    return "wednesday";
  } else if (day == 4) {
    return "thursday";
  } else if (day == 5) {
    return "friday";
  } else if (day == 6) {
    return "saturday";
  } else if (day == 7) {
    return "sunday";
  } else if (day == 8) {
    return "monday";
  } else if (day == 9) {
    return "tuesday";
  } else if (day == 10) {
    return "wednesday";
  } else if (day == 11) {
    return "thursday";
  } else if (day == 12) {
    return "friday";
  } else if (day == 13) {
    return "saturday";
  }
}
