import 'package:argedik/Core/Colors.dart';
import 'package:argedik/Dao/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MastersPage extends StatefulWidget {
  @override
  _MastersPageState createState() => _MastersPageState();
}

class _MastersPageState extends State<MastersPage> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Araç Servisleri').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Sometasdrong');
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Something went wrong');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var veri = snapshot.data!.docs[index].data() as Map;
              var deneme = veri["Ünvan"];
              return Card(
                //ünvanları aldığımız deneme
                //title: Text("${deneme.toString()}"),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.all(6),
                borderOnForeground: true,
                elevation: 25,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                semanticContainer: true,
                color: detailColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 15,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //network den resim çekiyoruz.
                          child: Image.network('${veri["Resim"]}'),
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 30,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Column(
                          children: [
                            Container(
                              child: Center(
                                  child: Text(
                                "${veri["Ünvan"]}",
                                style: TextStyle(fontSize: 16),
                              )),
                              color: bg2Color,
                              height:
                                  MediaQuery.of(context).size.height * 0.050,
                            ),
                            /*
                            *
                            * ? edewedwe*/
                            Divider(
                              height:
                                  MediaQuery.of(context).size.height * 0.005,
                            ),
                            Slidable(
                              actionPane: SlidableDrawerActionPane(),
                              actionExtentRatio: 0.25,
                              actions: [
                                IconSlideAction(
                                  caption: "Deneme",
                                  icon: Icons.face,
                                ),
                                IconSlideAction(
                                  caption: "Deneme",
                                  icon: Icons.face,
                                ),
                                IconSlideAction(
                                  caption: "Deneme",
                                  icon: Icons.phone_in_talk,
                                ),
                              ],
                              child: Container(
                                child: ListTile(
                                    title: Text(
                                  "${veri["Adres"]}",
                                  style: TextStyle(fontSize: 10),
                                )),
                                color: bg2Color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Column(
                        children: [
                          Container(
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                    text: "Telefon ",
                                    style: TextStyle(fontSize: 13),
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.phone_in_talk_sharp,
                                          size: 20,
                                          color: Colors.blue,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * 0.17,
                            height: MediaQuery.of(context).size.height * 0.030,
                            color: bg2Color,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: "Harita ",
                                    style: TextStyle(fontSize: 13),
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.map,
                                          size: 20,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.17,
                              height:
                                  MediaQuery.of(context).size.height * 0.030,
                              color: bg2Color,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    text: "Web ",
                                    style: TextStyle(fontSize: 13),
                                    children: [
                                      WidgetSpan(
                                        child: Icon(
                                          Icons.web_outlined,
                                          size: 20,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.17,
                              height:
                                  MediaQuery.of(context).size.height * 0.030,
                              color: bg2Color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}

Widget buildFile(BuildContext context, FirebaseFile file) {
  return ListTile(
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
        color: Colors.blue,
      ),
    ),
  );
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.all(15),
        borderOnForeground: true,
        elevation: 25,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        semanticContainer: true,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Image.asset('assets/services/Can Oto Servis.jpg'),
                  color: Colors.yellow,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                child: Column(children: [
                  Container(
                    child: Center(child: Text("absürWD")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absQQWDQWASDQWDQWDW")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
                child: Column(children: [
                  Container(
                    child: Center(child: Text("absürWD")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absQQWDQWASDQWDQWDW")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                  Container(
                    child: Center(child: Text("absürt")),
                    color: Colors.yellow,
                  ),
                ]),
              ),
            ),
          ],
        ));
  }
}
