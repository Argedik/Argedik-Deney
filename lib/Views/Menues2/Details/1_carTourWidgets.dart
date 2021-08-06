import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarTourController extends GetxController {}

// kahve olayı
/*





*/
double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;
final random = Random();
final arabalar = List.generate(
  _names.length,
  (index) => Araba(
      name: _names[index],
      model: _doubleInRange(random, 1, 7),
      image: "assets/pictures/${_names[index]}.jpg"),
);

class Araba {
  late final String name;
  late final double model;
  late final String image;

  Araba({required this.name, required this.model, required this.image});
}

final _names = [
  "Asure",
  "Dondurma",
  "Firinda_Sutlac",
  "Güllac",
  "Kadayif",
  "Macun_Sekeri",
  "Revani",
  "SekerPare",
  "Sutlac",
  "Sutlu_Nuriye",
];

class CarTourWidgets extends StatefulWidget {
  const CarTourWidgets({Key? key}) : super(key: key);

  @override
  _CarTourWidgetsState createState() => _CarTourWidgetsState();
}

class _CarTourWidgetsState extends State<CarTourWidgets> {
  final _pageController = PageController(viewportFraction: 0.35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("absürt"),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: Container(
              color: Colors.red,
            ),
          ),
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: arabalar.length,
            itemBuilder: (context, index) {
              final araba = arabalar[index];
              return Image.asset(araba.image);
            },
          ),
        ],
      ),
    );
  }
}
