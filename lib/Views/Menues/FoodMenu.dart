import 'package:argedik/Views/Menues/1_favorites.dart';
import 'package:argedik/Views/Menues/2_peak.dart';
import 'package:argedik/Views/Menues/3_home.dart';
import 'package:argedik/Views/Menues/4_society.dart';
import 'package:argedik/Views/Menues/Details/1_favoritesController.dart';
import 'package:argedik/Views/Menues/Details/2_peakController.dart';
import 'package:argedik/Views/Menues/Details/3_homeController.dart';
import 'package:argedik/Views/Menues/Details/4_societyController.dart';
import 'package:argedik/Views/Menues/Details/5_profilesController.dart';
import 'package:argedik/Views/Menues/Details/dashBoardController.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashBoardController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.blue.shade400,
            //alttaki 2 yani homepage butonu üstüne 12 mesaj var yazısı
            //bottomNavigationBar: ConvexAppBar.badge({2: "12"},
            initialActiveIndex: controller.tabIndex,
            items: [
              TabItem(icon: Icons.bookmark, title: "Favoriler"),
              TabItem(icon: Icons.addchart, title: "Zirve"),
              TabItem(icon: Icons.home, title: "Ana Sayfa"),
              TabItem(icon: Icons.people, title: "Toplum"),
              TabItem(
                  icon: Icons.perm_contact_calendar_rounded, title: "Profil"),
            ],
            onTap: controller.changeTabIndex,
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                Favorites(),
                Peak(),
                HomePage(),
                Society(),
                Society(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SampleBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SocietyController>(() => SocietyController());
    Get.lazyPut<ProfilesController>(() => ProfilesController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<PeakController>(() => PeakController());
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }
}
