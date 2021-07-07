import 'package:argedik/Models/PageManagement.dart' as route;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Profiles extends StatelessWidget {
  static const routeName = "/5";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil Sayfası"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Deneme",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                UserCredential userCredential =
                    await FirebaseAuth.instance.signInAnonymously();
                print(userCredential);

                FirebaseStorage _storage = FirebaseStorage.instance;
                Reference refFoods = _storage.ref();
                var photoUrl =
                    await refFoods.child("Asure.jpg").getDownloadURL();
                print(photoUrl);
              },
              child: Text("asdabsürt"),
            ),
          ],
        ),
      ),
    );
  }
}
