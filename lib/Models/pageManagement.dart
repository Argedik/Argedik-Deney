import 'package:argedik/Views/Menues/1_favorites.dart';
import 'package:argedik/Views/Menues/2_peak.dart';
import 'package:argedik/Views/Menues/3_home.dart';
import 'package:argedik/Views/Menues/4_society.dart';
import 'package:argedik/Views/Menues/5_profiles.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

//Dynamic Routes for generating navigation
const String pageManagement = PageManagement.routeName;
const String favorites = Favorites.routeName;
const String peak = Peak.routeName;
const String homePage = HomePage.routeName;
const String society = Society.routeName;
const String profiles = Profiles.routeName;

class PageManagement extends StatefulWidget {
  static const String routeName = '/HomePage';
  @override
  State<PageManagement> createState() => _PageManagementState();
}

class _PageManagementState extends State<PageManagement> {
  int _aktifIcerikNo = 2;
  late List<Widget> _icerikler;

  @override
  void initState() {
    super.initState();

    _icerikler = [
      Favorites(),
      Peak(),
      HomePage(),
      Society(),
      Profiles(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue.shade400,
        //alttaki 2 yani homepage butonu üstüne 12 mesaj var yazısı
        //bottomNavigationBar: ConvexAppBar.badge({2: "12"},
        initialActiveIndex: _aktifIcerikNo,
        items: [
          TabItem(icon: Icons.bookmark, title: "Favoriler"),
          TabItem(icon: Icons.addchart, title: "Zirve"),
          TabItem(icon: Icons.home, title: "Ana Sayfa"),
          TabItem(icon: Icons.people, title: "Toplum"),
          TabItem(icon: Icons.perm_contact_calendar_rounded, title: "Profil"),
        ],
        onTap: (int tiklananButonPozisyonNo) {
          setState(() {
            _aktifIcerikNo = tiklananButonPozisyonNo;
          });
        },
      ),
      body: _icerikler[_aktifIcerikNo],
    );
  }
}

//isimlendirilmiş sayfa geçişleri olayı bottomnavbar ile ilgisi yok
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case pageManagement:
      return MaterialPageRoute(builder: (_) => PageManagement());
    case favorites:
      return MaterialPageRoute(builder: (_) => Favorites());
    case peak:
      return MaterialPageRoute(builder: (_) => Peak());
    case homePage:
      return MaterialPageRoute(builder: (_) => HomePage());
    case society:
      return MaterialPageRoute(builder: (_) => Society());
    case profiles:
      return MaterialPageRoute(builder: (_) => Profiles());
    default:
      return MaterialPageRoute(builder: (_) => PageManagement());
  }
}
