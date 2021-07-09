import 'package:argedik/Models/PageManagement.dart' as route;
import 'package:argedik/Views/Menues/Details/4_societyController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Society extends GetView<SocietyController> {
  static const routeName = "/4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Society Sayfası"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              width: 200,
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {},
                child: Text('TextButton'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
