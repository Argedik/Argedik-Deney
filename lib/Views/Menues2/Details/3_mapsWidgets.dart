import 'package:argedik/Views/Menues3/gameHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapsWidgets extends StatelessWidget {
  const MapsWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hazırlık"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 10.0, right: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => GameHomePage()));
            // return Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => GameHomePage());
          },
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.yellow,
            child: Center(
                child: Text(
              "Oyuna Başla",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            )),
          ),
        ),
      ),
    );
  }
}
