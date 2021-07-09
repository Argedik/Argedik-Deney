import 'package:argedik/Models/PageManagement.dart' as route;
import 'package:argedik/Views/Menues/Details/2_peakController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Peak extends GetView<PeakController> {
  static const routeName = "/2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peak Sayfası"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: 200,
              child: Center(
                child: Container(
                  child: Text("Peak Sayfası"),
                  decoration: BoxDecoration(shape: BoxShape.rectangle),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
