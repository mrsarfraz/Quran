import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran/app/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SplashController controller = Get.put(SplashController());

    Timer(
      const Duration(seconds: 3),
      () => controller.isFirst(),
    );

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: 200.0,
                height: 200.0,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Islamic.png',
            ),
          ),
        ],
      ),
    );
  }
}
