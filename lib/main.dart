import 'package:argedik/Core/themes.dart';
import 'package:argedik/Getx/Services/Theme_service.dart';
import 'package:argedik/Models/pageManagement.dart';
import 'package:argedik/Views/Menues/2_peak.dart';
import 'package:argedik/Views/Menues/3_home.dart';
import 'package:argedik/Views/Menues/5_profiles.dart';
import 'package:argedik/Views/Menues/dashBoard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:argedik/Models/PageManagement.dart' as route;
import 'Dao/firebase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<Auth>(
      create: (context) => Auth(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Argedik',
        unknownRoute:
            GetPage(name: '/notfound', page: () => CircularProgressIndicator()),
        home: StartPage(),
        themeMode: ThemeService().getThemeMode(),
        darkTheme: Themes().darkTheme,
        theme: Themes().lightTheme,
        routingCallback: (routing) {
          if (routing!.current == "/3") {
            Profiles();
          }
        },
      ),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //import 'package:flutter/services.dart kütüphanesi sayesinde statusbar(telefonun en üstündeki saat pil vs) gizleme
    SystemChrome.setEnabledSystemUIOverlays([]);
    double genislik = MediaQuery.of(context).size.width;
    double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: yukseklik,
        width: genislik,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xffffaa00),
              const Color(0xfe79d70f),
              const Color(0xfc79d70f),
            ],
          ),
        ),
        child: Stack(
          children: [
            //Orta kısım görünümü

            Container(
              //genişliği ekrana sığdır.
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 12,
                    child: Text(''),
                  ),
                  Expanded(
                    flex: 18,
                    child: Stack(
                      children: [
                        TextButton(
                          onPressed: () {
                            //Navigator.push a Named eklendiği zaman MaterialApp route kısmında tanımlanan map yapısındaki sayfalara ulaşabiliyoruz.
                            //Navigator.pushReplacementNamed(context, '/HomePage2');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Peak()));
                            print("absürt");
                            //Navigator.pushNamed(context, HomePage.routeName);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 66,
                            width: 275,
                            child: Container(
                              width: genislik * 0.4,
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Fazla aş ya karın ağrıtır ya da baş.',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        color: const Color(0xffedf4f2),
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //kenarlıklara kıvrım
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(200.0),
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(200.0),
                                bottomLeft: Radius.circular(20.0),
                              ),

                              //renk ayarları
                              gradient: RadialGradient(
                                //renk dalgasının x ve y eksenleri
                                //center: Alignment(0.0, 0.0),
                                radius: 2,
                                colors: [
                                  const Color(0xfcf5a31a),
                                  const Color(0xfcd32626)
                                ],
                                //renk tonlarında 0-1 arasındaki duruş yerleri
                                stops: [0.0, 1.0],
                                tileMode: TileMode.mirror,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x29000000),
                                  offset: Offset(0, 8),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Alt kısım görünümü
            Positioned(
              top: yukseklik - 120,
              left: -120,
              child: Image.asset('assets/Materials/Daire.png'),
            ),

            //Üst kısım görünümü
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Image.asset('assets/Materials/Argedik_logo.png'),
            ),
          ],
        ),
      ),
    );
  }
/* istersek kullanabileceğimiz bi oop yapısı
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  */

}
