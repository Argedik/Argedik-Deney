import 'package:argedik/Getx/Services/Theme_service.dart';
import 'package:argedik/Views/Menues/Details/1_favoritesController.dart';
import 'package:argedik/Views/Menues2/CarMenu.dart';
import 'package:argedik/Views/Menues2/Details/carMenuController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorites extends GetView<FavoritesController> {
  static const routeName = "/1";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarMenuController>(
        init: CarMenuController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Favorites Sayfası"),
            ),
            body: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        ThemeService().changeThemeMode();
                        Get.to(CarMenu());
                      },
                      child: null,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
