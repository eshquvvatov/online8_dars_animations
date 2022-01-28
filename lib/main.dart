import 'package:flutter/material.dart';
import 'package:online8_dars_animations/pages/home_page.dart';

import 'animation/forworking_hinge_animation.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      home: HomePage()
    );
  }
}
