import 'package:fakestore/views/variable/variables.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
