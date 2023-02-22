import 'dart:math';

List qoute = [
  "assets/images/qoutes/q1.png",
  "assets/images/qoutes/q2.png",
  "assets/images/qoutes/q3.png",
  "assets/images/qoutes/q4.png",
  "assets/images/qoutes/q5.png",
  "assets/images/qoutes/q6.png",
  "assets/images/qoutes/q7.png",
  "assets/images/qoutes/q8.png",
  "assets/images/qoutes/q9.png",
];
String getqoute() {
  Random a = Random();
  int ran = a.nextInt(9) + 1;
  print(ran);

  return qoute
      .where((element) => element == "assets/images/qoutes/q$ran.png")
      .toList()
      .join("");
}
