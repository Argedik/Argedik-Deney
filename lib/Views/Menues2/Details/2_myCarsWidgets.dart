import 'package:argedik/Core/Colors.dart';
import 'package:argedik/Dao/firebase.dart';
import 'package:argedik/Models/Buttons.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCarsWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return FutureBuilder(
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          appBar: AppBar(
            title: Text("Arabalarım"),
          ),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  //araba resmi
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      ),
                      child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/argedik-2366e.appspot.com/o/Arabalar%2FAudi%20A3.jpg?alt=media&token=a321bfe6-517c-44e8-a8f5-acf66669f122",
                        width: genislik,
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: yukseklik * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      ),
                    ),
                  ),

                  //araba başlığı
                  Container(
                    child: Center(
                      child: Text(
                        "2020 Audi A3 Sedan 1.5 TFSI",
                        style: TextStyle(
                            color: Colors.lightBlueAccent,
                            shadows: [
                              Shadow(
                                  color: Colors.white,
                                  blurRadius: 2.0,
                                  offset: Offset(1, 0)),
                            ],
                            fontSize: 21,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    height: yukseklik * 0.1,
                    decoration: BoxDecoration(
                      color: bg2Color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),

                  //araba açıklaması
                  Container(
                    height: yukseklik * 0.5,
                    color: detailColor,
                    width: genislik,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 24,
                        right: 8,
                        bottom: 24,
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom:
                                    BorderSide(width: 3, color: Colors.black45),
                              ),
                            ),
                          ),
                          CarDetails(
                              Text1: "Silindir Hacmi: 1498 cc",
                              Text2: "Maksimum Hız: 224 km/s"),
                          CarDetails(
                              Text1: "Beygir Gücü: 150 HP",
                              Text2: "0-100 Km Hızlanma: 8.2 sn"),
                          CarDetails(
                              Text1: "Vites Tipi: 7 İleri Otomatik",
                              Text2: "0-100 Km Hızlanma: 8.2 sn"),
                          CarDetails(
                              Text1: "Şehir İçi Ort. Tük.: 6.4 lt",
                              Text2: "Şehir Dışı Ort. Tük.: 4.4 lt"),
                          CarDetails(
                              Text1: "Karma Yakıt Tüketimi: 5.1 lt",
                              Text2: "Uzunluk: 4458 mm"),
                          CarDetails(
                              Text1: "Genişlik: 1796 mm",
                              Text2: "Yükseklik: 1416 mm"),
                          CarDetails(
                              Text1: "Maksimum Tork: 250 Nm",
                              Text2: "Boş Ağırlık: 1280 kg"),
                          CarDetails(
                              Text1: "Bagaj Hacmi: 425 lt",
                              Text2: "Yakıt Deposu: 50 lt"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              /*child: Stack(
                children: [
                  //arkaplan
                  Container(
                    color: bgColor,
                    child: Center(child: Text("downloadURL")),
                  ),
                  //önplan
                  Container(
                    margin: EdgeInsets.only(top: yukseklik * 0.2255),
                    height: yukseklik * 0.7,
                    child: Center(child: Text("asdsad")),
                    decoration: BoxDecoration(
                      color: bg2Color,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                  ),
                  //araba yolu
                  Container(
                    margin: EdgeInsets.only(top: yukseklik * 0.2255),
                    height: yukseklik * 0.1,
                    decoration: BoxDecoration(
                      color: detailColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0)),
                      boxShadow: [BoxShadow(color: Colors.red)],
                    ),
                  ),
                  //araba
                  Container(
                    margin: EdgeInsets.only(
                        top: yukseklik * 0.25, left: genislik * 0.5),
                    height: yukseklik * 0.15,
                    width: genislik * 0.45,
                    child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/argedik-2366e.appspot.com/o/Arabalar%2FAudi%20A3.jpg?alt=media&token=a321bfe6-517c-44e8-a8f5-acf66669f122"),
                  ),
                ],
              ),*/
            ),
          ),
        );
      },
    );
  }
}

class CarDetails extends StatelessWidget {
  String Text1;
  String Text2;

  CarDetails({required this.Text1, required this.Text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 3, color: Colors.black45),
          right: BorderSide(width: 3, color: Colors.black45),
          bottom: BorderSide(width: 3, color: Colors.black45),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.end,
                children: [
                  Text(
                    Text1,
                    softWrap: true,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                direction: Axis.vertical,
                alignment: WrapAlignment.end,
                children: [
                  Text(
                    Text2,
                    softWrap: true,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
