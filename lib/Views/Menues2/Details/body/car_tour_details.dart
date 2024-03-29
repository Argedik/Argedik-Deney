import 'package:argedik/Models/Cars.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarTourDetails extends StatelessWidget {
  const CarTourDetails({Key? key, required this.araba}) : super(key: key);

  final Araba araba;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            child: Hero(
              tag: "text_${araba.name}",
              child: Material(
                child: Text(
                  araba.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: size.height * 0.4,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Hero(
                    tag: araba.image,
                    child: Image.asset(araba.image, fit: BoxFit.fitHeight),
                  ),
                ),
                Positioned(
                  left: size.width * 0.05,
                  bottom: 0,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0.0),
                    builder: (context, value, child) {
                      return Transform.translate(
                        child: child,
                        offset: Offset(-100 * value, 240 * value),
                      );
                    },
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "\$${araba.model.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 10,
                              spreadRadius: 20,
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
