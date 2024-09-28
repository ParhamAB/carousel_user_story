import 'package:carousel_user_story/configs/theme.dart';
import 'package:carousel_user_story/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carousel Story User',
      theme: myTheme(context),
      home: const SplashScreen(),
    );
  }
}
