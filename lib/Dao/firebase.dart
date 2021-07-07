import 'package:argedik/Dao/database.dart';
import 'package:argedik/Models/Foods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class FirebaseApi {
  static Future<List<String>> _getDownloadLinks(List<Reference> refs) =>
      Future.wait(refs.map((ref) => ref.getDownloadURL()).toList());
  static Future<List<FirebaseFile>> listAll(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final urls = await _getDownloadLinks(result.items);
    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);

          return MapEntry(index, file);
        })
        .values
        .toList();
  }

/*static Future downloadFile(Reference ref) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/${ref.name}');

    await ref.writeToFile(file);
  }*/
}

class FirebaseFile {
  final Reference ref;
  final String name;
  final String url;

  const FirebaseFile({
    @required this.ref,
    @required this.name,
    @required this.url,
  });
}

class Auth {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<User> signInAnonymously() async {
    final userCredentials = await _firebaseAuth.signInAnonymously();
    return userCredentials.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

class Firebase2 extends ChangeNotifier {
  String _collectionPath = "books";
  Database _database = Database();

  //Firebase yemekleri listeleme kodu
  Stream<List<Food>> getFoodList() {
    Stream<List<DocumentSnapshot>> streamListDocument = _database
        .getFoodListFromApi(_collectionPath)
        .map((querySnapshot) => querySnapshot.docs);

    Stream<List<Food>> streamListFood = streamListDocument.map(
        (listOfDocSnap) => listOfDocSnap
            .map((docSnap) =>
                Food.fromMap(docSnap.data() as Map<String, dynamic>))
            .toList());
    return streamListFood;
  }

  //Firebase den yemek silme kodu
  Future<void> deleteFood(Food food) async {
    await _database.deleteDocument(referencePath: _collectionPath, id: food.id);
  }

  List<UploadTask> _uploadTask = [];

  Future<UploadTask> uploadFile(PickedFile file) async {
    UploadTask uploadTask;
    Reference ref =
        FirebaseStorage.instance.ref().child('/Foods').child('/Asure.jpg');
    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});
    return Future.value(uploadTask);
  }
}
