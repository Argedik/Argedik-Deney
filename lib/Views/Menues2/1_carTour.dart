import 'package:argedik/Views/Menues2/Details/1_carTourWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarTourController extends GetxController {}

class CarTour extends StatelessWidget {
  const CarTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarTourWidgets();
  }
}
