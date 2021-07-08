import 'package:argedik/Dao/firebase.dart';
import 'package:argedik/Getx/Services/Theme_service.dart';
import 'package:argedik/Models/PageManagement.dart' as route;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Profiles extends StatefulWidget {
  static const routeName = "/5";

  @override
  _ProfilesState createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  late Future<List<FirebaseFile>> futureFiles;

  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseApi.listAll("Arabalar/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Sayfası"),
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
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: files!.length,
                          itemBuilder: (context, index) {
                            final file = files[index];
                            return buildFile(context, file);
                          },
                        ),
                      ),
                      Text(
                        "Deneme",
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          ThemeService().changeThemeMode();
                          UserCredential userCredential =
                              await FirebaseAuth.instance.signInAnonymously();
                          print(userCredential);

                          FirebaseStorage _storage = FirebaseStorage.instance;
                          Reference refFoods = _storage.ref();
                          var photoUrl = await refFoods
                              .child("Asure.jpg")
                              .getDownloadURL();
                          print(photoUrl);
                        },
                        child: Text("asdabsürt"),
                      ),
                    ],
                  ),
                );
              }
          }
        },
      ),
    );
  }

  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
        //resimleri indirme=image network
        //oval şekle getirme =ClipOval
        leading: ClipOval(
          child: Image.network(
            file.url,
            width: 52,
            height: 52,
            fit: BoxFit.cover,
          ),
        ),

        // ilk text alanı tanımlandı. Tüm resimlerin sadece isim ve uzantılarını text halinde alıyor.
        title: Text(
          file.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: Colors.blue,
          ),
        ),
      );
}
