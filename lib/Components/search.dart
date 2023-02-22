import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weatherModel.dart';
import 'package:weather_app/Providers/Weather_Provider.dart';
import 'package:weather_app/Services/Weather_Services.dart';

List<String> suggestons = [
  "Cairo",
  "Ismailia",
  "Alexandria",
  "Kabul",
  "Tirana ",
  "Algiers",
  "Andorra la Vella",
  "Luanda",
  "Saint John's",
  "Buenos Aires",
  "Yerevan",
  "Canberra",
  "Vienna",
  "Baku",
  "Nassau",
  "Manama",
  "Dhaka",
  "Bridgetown",
  "Minsk",
  "Brussels",
  "Belmopan",
  "Porto Novo",
  "Thimphu",
  "La Paz",
  "Sucre",
  "Sarajevo",
  "Gaborone",
  "Brasilia",
  "Bandar Seri Begawan",
  "Sofia",
  "Ouagadougou",
  "Gitega",
  "Phnom Penh",
  "Yaounde",
  "Ottawa",
  "Praia",
  "Bangui",
  "N'Djamena",
  "Santiago",
  "Beijing",
  "Bogota",
  "Moroni",
  "Kinshasa",
  "Brazzaville",
  "San Jose",
  "Yamoussoukro",
  "Zagreb",
  "Havana",
  "Nicosia",
  "Prague",
  "Copenhagen",
  "Djibouti",
  "Roseau",
  "Santo Domingo",
  "Dili",
  "Quito",
  "San Salvador",
  "Malabo",
  "Asmara",
  "Tallinn",
  "Mbabana",
  "Addis Ababa",
  "Palikir",
  "Suva",
  "Helsinki",
  "Paris",
  "Libreville",
  "Banjul",
  "Tbilisi",
  "Berlin",
  "Accra",
  "Athens",
  "Saint George's",
  "Guatemala City",
  "Conakry",
  "Bissau",
  "Georgetown",
  "Port au Prince",
  "Tegucigalpa",
  "Budapest",
  "Reykjavik",
  "New Delhi",
  "Jakarta",
  "Tehran",
  "Baghdad",
  "Dublin",
  "Jerusalem",
  "Rome",
  "Kingston",
  "Tokyo",
  "Amman",
  "Nur-Sultan",
  "Nairobi",
  "Tarawa Atoll",
  "Pristina",
  "Kuwait City",
  "Bishkek",
  "Vientiane",
  "Riga",
  "Beirut",
  "Maseru",
  "Monrovia",
  "Tripoli",
  "Vaduz",
  "Vilnius",
  "Luxembourg",
  "Antananarivo",
  "Lilongwe",
  "Kuala Lumpur",
  "Male",
  "Bamako",
  "Valletta",
  "Majuro",
  "Nouakchott",
  "Port Louis",
  "Mexico City",
  "Chisinau",
  "Monaco",
  "Ulaanbaatar",
  "Podgorica",
  "Rabat",
  "Maputo",
  "Nay Pyi Taw",
  "Windhoek",
  "Nauru",
  "Kathmandu",
  "Amsterdam",
  "Wellington",
  "Managua",
  "Niamey",
  "Abuja",
  "Pyongyang",
  "Skopje",
  "Belfast",
  "Oslo",
  "Muscat",
  "Islamabad",
  "Melekeok",
  "Panama City",
  "Port Moresby",
  "Asuncion",
  "Lima",
  "Manila",
  "Warsaw",
  "Lisbon",
  "Doha",
  "Bucharest",
  "Moscow",
  "Kigali",
  "Basseterre",
  "Castries",
  "Kingstown",
  "Apia",
  "San Marino",
  "Sao Tome",
  "Riyadh",
  "Edinburgh",
  "Dakar",
  "Belgrade",
  "Victoria",
  "Freetown",
  "Singapore",
  "Bratislava",
  "Ljubljana",
  "Honiara",
  "Mogadishu",
  "Pretoria",
  "Seoul",
  "Juba",
  "Madrid",
  "Sri Jayawardenapura Kotte",
  "Khartoum",
  "Paramaribo",
  "Stockholm",
  "Bern",
  "Damascus",
  "Taipei",
  "Dushanbe",
  "Dodoma",
  "Bangkok",
  "Lome",
  "Nuku'alofa",
  "Port of Spain",
  "Tunis",
  "Ankara",
  "Ashgabat",
  "Funafuti",
  "Kampala",
  "Kyiv or Kiev",
  "Abu Dhabi",
  "London",
  "Washington",
  "Montevideo",
  "Tashkent",
  "Port Vila",
  "Vatican City",
  "Caracas",
  "Hanoi"
];

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  WeatherModel? weather;
  String? cityName;
  GlobalKey<FormState> searchKey = new GlobalKey<FormState>();

  validation() {
    var searchData = searchKey.currentState;
    if (searchData!.validate()) {}
    searchData.save();
  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        } else {
          List<String> matches = <String>[];
          matches.addAll(suggestons);

          matches.retainWhere((s) {
            return s
                .toLowerCase()
                .startsWith(textEditingValue.text.toLowerCase());
          });
          return matches;
        }
      },
      onSelected: (String selection) {
        print('You just selected $selection');
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return Form(
          key: searchKey,
          child: Container(
            margin: EdgeInsets.all(20),
            child: TextFormField(
              controller: textEditingController,
              focusNode: focusNode,

              validator: (value) {
                if (weather == null) {
                  return "There is no city named : $value, please try again";
                } else {
                  return null;
                }
              },
              // الاون تشانجد بترجعلك الداتا الي اليوزر بيكتبها اول باول منغير ميعمل سيرش (يدورس انتر)
              onChanged: (value) {
                cityName = value;
                print(value);
              },
              onSaved: (val) async {
                cityName = val;
              },
              decoration: InputDecoration(
                hintText: "Enter a City",
                label: Text(
                  "Search",
                  style: TextStyle(color: Color.fromARGB(255, 194, 194, 194)),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    print("cityName is : $cityName");
                    weatherService service = weatherService();
                    weather = await service.getWeather(cityName!);
                    Provider.of<WeatherProvider?>(context, listen: false)
                        ?.weatherData = weather;

                    // updateUi!();
                    if (weather == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Error')),
                      );
                      validation();
                    }
                    textEditingController.clear();
                  },
                  icon: Icon(Icons.search, color: Colors.black),
                ),
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 194, 194, 194))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 194, 194, 194))),
              ),
            ),
          ),
        );
      },
      optionsViewBuilder: (BuildContext context,
          void Function(String) onSelected, Iterable<String> options) {
        return Material(
            child: SizedBox(
                height: 200,
                child: ListView(
                  children: options.map((opt) {
                    return InkWell(
                        onTap: () {
                          onSelected(opt);
                        },
                        child: Container(
                            child: Card(
                                child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          child: Text(opt),
                        ))));
                  }).toList(),
                )));
      },
    );
  }
}
