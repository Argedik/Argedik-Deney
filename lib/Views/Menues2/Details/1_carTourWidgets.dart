import 'dart:math';

import 'package:argedik/Models/Cars.dart';
import 'package:argedik/Views/Menues2/Details/body/car_tour_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarTourController extends GetxController {}

// kahve olayı

const _duration = Duration(milliseconds: 320);
const _initialPage = 8.0;

class CarTourWidgets extends StatefulWidget {
  const CarTourWidgets({Key? key}) : super(key: key);

  @override
  _CarTourWidgetsState createState() => _CarTourWidgetsState();
}

class _CarTourWidgetsState extends State<CarTourWidgets> {
  // final _pageController = PageController(viewportFraction: 0.35);
  final _pageController =
      PageController(viewportFraction: 0.35, initialPage: _initialPage.toInt());
  final _pageTextController = PageController(initialPage: _initialPage.toInt());
  double _currentPage = _initialPage;
  double _textPage = _initialPage;

  void _carScrollListener() {
    setState(() {
      _currentPage = _pageController.page!;
    });
  }

  void _textScrollListener() {
    _textPage = _currentPage;
  }

  @override
  void initState() {
    _pageController.addListener(_carScrollListener);
    _pageTextController.addListener(_textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_carScrollListener);
    _pageTextController.removeListener(_textScrollListener);
    _pageController.dispose();
    _pageTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("absürt"),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            child: DecoratedBox(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.brown,
                  blurRadius: 90,
                  spreadRadius: 45,
                )
              ]),
            ),
            left: 20,
            right: 20,
            bottom: -size.height * 0.22,
            height: size.height * 0.3,
          ),

          //kahve resimlerinin  arka arkaya sıralandığı kodlar
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: arabalar.length + 1,
              onPageChanged: (value) {
                if (value < arabalar.length) {
                  _pageTextController.animateToPage(value,
                      duration: _duration, curve: Curves.easeOut);
                }
              },
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SizedBox.shrink();
                }
                final araba = arabalar[index - 1]; // alınacak index resim
                final result = _currentPage - index + 1; //
                final value = -0.4 * result + 1;
                final opacity = value.clamp(0.0, 1.0);
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 650),
                          pageBuilder: (context, animation, _) {
                            return FadeTransition(
                              opacity: animation,
                              child: CarTourDetails(araba: araba),
                            );
                          }),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..translate(0.0, size.height / 2.6 * (1 - value).abs())
                        ..scale(value),
                      child: Opacity(
                        opacity: opacity,
                        child: Hero(
                          tag: araba.name,
                          child: Image.asset(
                            araba.image,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 100,
            child: ValueListenableBuilder<double>(
                valueListenable: ValueNotifier<double>(_textPage),
                builder: (context, textPage, _) {
                  return Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                            controller: _pageTextController,
                            itemCount: arabalar.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final opacity = (1 - (index - _textPage).abs())
                                  .clamp(0.0, 1.0);
                              return Opacity(
                                opacity: opacity,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.2),
                                  child: Text(
                                    arabalar[index].name,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              );
                            }),
                      ),
                      const SizedBox(height: 15),

                      //kahve üzerindeki dolar fiyatları arasındaki geçiş animasyonu
                      AnimatedSwitcher(
                        duration: _duration,
                        child: Text(
                          "\$${arabalar[_textPage.toInt()].model.toStringAsFixed(2)}",
                          style: TextStyle(color: Colors.black, fontSize: 24),
                          key: Key(arabalar[_textPage.toInt()].name),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
