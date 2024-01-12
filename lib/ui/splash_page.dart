import 'dart:async';
import 'package:flutter/material.dart';

//* This is the splash_page of the app

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacementNamed('/landing'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'CatBreeds',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.4),
            Image.asset('assets/splash_image.png'),
          ],
        ),
      ),
    );
  }
}
