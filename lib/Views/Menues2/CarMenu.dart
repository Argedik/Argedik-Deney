import 'package:argedik/Views/Menues/1_favorites.dart';
import 'package:argedik/Views/Menues/5_profiles.dart';
import 'package:argedik/Views/Menues2/1_carTour.dart';
import 'package:argedik/Views/Menues2/2_myCars.dart';
import 'package:argedik/Views/Menues2/3_maps.dart';
import 'package:argedik/Views/Menues2/4_masters.dart';
import 'package:argedik/Views/Menues2/Details/carMenuController.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CarMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarMenuController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.blue.shade400,
            //alttaki 2 yani homepage butonu üstüne 12 mesaj var yazısı
            //bottomNavigationBar: ConvexAppBar.badge({2: "12"},
            initialActiveIndex: controller.tabIndex,
            items: [
              TabItem(icon: Icons.local_car_wash, title: "Araba turu"),
              TabItem(icon: Icons.directions_car_rounded, title: "Arabalarım"),
              TabItem(icon: Icons.map, title: "Haritalar"),
              TabItem(icon: Icons.handyman, title: "Ustalar"),
              TabItem(
                  icon: Icons.perm_contact_calendar_rounded, title: "Profil"),
            ],
            onTap: controller.changeTabIndex,
          ),
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                CarTour(),
                MyCars(),
                Maps(),
                Masters(),
                Profiles(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CarBinding extends Bindings {
  @override
  void dependencies() {}
  /*void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SocietyController>(() => SocietyController());
    Get.lazyPut<ProfilesController>(() => ProfilesController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<PeakController>(() => PeakController());
    Get.lazyPut<DashBoardController>(() => DashBoardController());
  }*/
}
