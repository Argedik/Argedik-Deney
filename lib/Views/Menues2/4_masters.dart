import 'package:argedik/Dao/firebase.dart';
import 'package:argedik/Views/Menues2/Details/4_mastersWidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MastersController extends GetxController {}

class Masters extends StatelessWidget {
  Future<List<FirebaseFile>> futureFiles = FirebaseApi.listAll("Arabalar/");

  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text("Masters"),
      ),
      body: FutureBuilder<List<FirebaseFile>>(
        future: futureFiles,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Hata çıktı profiles sayfasında"),
                );
              } else {
                final files = snapshot.data;
                return MastersPage();
              }
          }
        },
      ),
    );
  }
}
