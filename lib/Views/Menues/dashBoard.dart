import 'package:argedik/Views/Menues/1_favorites.dart';
import 'package:argedik/Views/Menues/2_peak.dart';
import 'package:argedik/Views/Menues/3_home.dart';
import 'package:argedik/Views/Menues/4_society.dart';
import 'package:argedik/Views/Menues/5_profiles.dart';
import 'package:argedik/Views/Menues/Details/dashBoardController.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  static const String routeName = '/HomePage2';
  int _aktifIcerikNo = 2;
  List<Widget> _icerikler = [
    Favorites(),
    Peak(),
    Society(),
    Profiles(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    print("absürt 2");
    return GetBuilder<DashBoardController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue.shade400,
          //alttaki 2 yani homepage butonu üstüne 12 mesaj var yazısı
          //bottomNavigationBar: ConvexAppBar.badge({2: "12"},
          //initialActiveIndex: _aktifIcerikNo,
          currentIndex: controller.tabIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: "Favoriler"),
            TabItem(icon: Icons.addchart, title: "Zirve"),
            TabItem(icon: Icons.home, title: "Ana Sayfa"),
            TabItem(icon: Icons.people, title: "Toplum"),
            TabItem(icon: Icons.perm_contact_calendar_rounded, title: "Profil"),
          ],
          onTap: (int tiklananButonPozisyonNo) {
            _aktifIcerikNo = tiklananButonPozisyonNo;
          },
        ),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomePage(),
              Society(),
              Profiles(),
              Favorites(),
              Peak(),
            ],
          ),
        ),
      );
    });
  }
}
