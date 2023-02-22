// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:weather_app/Models/weatherModel.dart';
// import 'package:weather_app/Providers/Weather_Provider.dart';
// import 'package:weather_app/Services/Weather_Services.dart';

// class SearchPage extends StatefulWidget {
//   VoidCallback? updateUi;

//   SearchPage({this.updateUi});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   WeatherModel? weather;

//   String? cityName;

//   GlobalKey<FormState> searchKey = new GlobalKey<FormState>();

//   validation() {
//     var searchData = searchKey.currentState;
//     if (searchData!.validate()) {}
//     searchData.save();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Form(
//               key: searchKey,
//               child: TextFormField(
//                 validator: (value) {
//                   if (weather == null) {
//                     return "There is no city named : $value, please try again";
//                   } else {
//                     return null;
//                   }
//                 },
//                 // الاون تشانجد بترجعلك الداتا الي اليوزر بيكتبها اول باول منغير ميعمل سيرش (يدورس انتر)
//                 onChanged: (value) {
//                   cityName = value;
//                   print(value);
//                 },
//                 onSaved: (val) async {
//                   cityName = val;
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Enter a City",
//                   label: Text("Search"),
//                   suffixIcon: IconButton(
//                     onPressed: () async {
//                       print("cityName is : $cityName");
//                       weatherService service = weatherService();
//                       weather = await service.getWeather(cityName!);
//                       Provider.of<WeatherProvider?>(context, listen: false)
//                           ?.weatherData = weather;

//                       // updateUi!();
//                       if (weather == null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Error')),
//                         );
//                         validation();
//                       } else {
//                         Navigator.pop(context);
//                       }
//                     },
//                     icon: Icon(Icons.search),
//                   ),
//                   contentPadding: EdgeInsets.all(25),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(7)),
//                 ),
//               ),
//             ),
//             Image.asset("assets/images/search.png")
//           ],
//         ),
//       ),
//     );
//   }
// }
