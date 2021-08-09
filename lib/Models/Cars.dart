import 'dart:math';

double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start) + start;
final random = Random();
final arabalar = List.generate(
  _names.length,
  (index) => Araba(
      name: _names[index],
      model: _doubleInRange(random, 3, 7),
      //image: "assets/pictures/${_names[index]}.jpg"),
      image: "assets/coffees/${index + 1}.png"),
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
