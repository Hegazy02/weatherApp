import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Components/days.dart';
import 'package:weather_app/Components/hours.dart';
import 'package:weather_app/Components/search.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {
      print("************************");
      print(Provider.of<WeatherProvider?>(context, listen: false)?.weatherData);
    });
  }

//عايزا شغل فنكشن ابديت يو اي لما اعمل حاجه بروح مباصي الفنكشن دي للكلاس الي بيعمل الحاجه دي
//ومنادي عليها لما الحاجه تتعمل
//فبيجي هنا ويشغلها فيعمل الابديت
//لما استخدمنا البروفايدر السيت ستات مبقاش ليها لازمه
  WeatherModel? Data;
  DateTime realTime = DateTime.parse('0000-00-00 00:00:00Z');

  @override
  Widget build(BuildContext context) {
    Data = Provider.of<WeatherProvider>(context).weatherData;
    try {
      realTime = DateTime.parse(Data!.date);
    } catch (e) {
      print(e);
    }

    return Scaffold(
        body: Data == null
            ? Column(
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Image.asset("assets/images/home.png"),
                  search(),
                  Spacer(
                    flex: 5,
                  ),
                ],
              )
            //  Image.asset(
            //     getqoute(),
            //     fit: BoxFit.fill,
            //   )
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/real/Asset 21.png",
                      )),
                  // gradient: LinearGradient(
                  //     begin: Alignment.topCenter,
                  //     end: Alignment.bottomCenter,
                  //     colors: [
                  //       Data!.getColor(),
                  //       Data!.getColor()[400]!,
                  //       Data!.getColor()[300]!,
                  //       Data!.getColor()[200]!,
                  //       Data!.getColor()[100]!,
                  //     ])
                ),
                child: Column(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    search(),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      "${Data!.city}",
                      style: TextStyle(fontSize: 22, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Spacer(),
                        Text("Updated:  ",
                            style: TextStyle(color: Colors.white)),
                        Text(DateFormat('h:mm a').format(realTime),
                            style: TextStyle(color: Colors.white)),
                        Spacer(),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 120, child: Image.asset(Data!.getImage())),
                        Text(
                          //فنكن سايل لو كان العدد العشري 5 او كبر هتقرب الرقم
                          "${Data!.temp.toInt().ceil()}",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text("maxtemp : ",
                                    style: TextStyle(color: Colors.white)),
                                Text("mintemp  : ",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("${Data!.maxTemp.toInt().ceil()}",
                                    style: TextStyle(color: Colors.white)),
                                Text("${Data!.minTemp.toInt().ceil()}",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      "${Data!.condition}",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    hou(),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Divider()),
                    Expanded(flex: 10, child: days()),
                  ],
                ),
              ));
  }
}
