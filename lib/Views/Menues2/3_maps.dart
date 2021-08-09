import 'package:argedik/Views/Menues2/Details/3_mapsWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapsController extends GetxController {}

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapsWidgets(),
    );
  }
}
