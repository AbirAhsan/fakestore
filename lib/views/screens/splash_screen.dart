import 'package:fakestore/controller/splash_screen_controller.dart';
import 'package:fakestore/views/variable/variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SplashScreenController splashScreenCtrl =
        Get.put(SplashScreenController());
    return const Scaffold(
      body: Center(
        child: Text(
          appName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
