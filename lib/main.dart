import 'package:flutter/material.dart';
import 'package:flutter_google_map/home_screen.dart';
import 'package:flutter_google_map/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Google Map',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const SplashScreen());
  }
}
