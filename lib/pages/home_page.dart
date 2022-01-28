import 'package:flutter/material.dart';
import 'package:online8_dars_animations/animation/bounce_animation.dart';
import 'package:online8_dars_animations/animation/forworking_hinge_animation.dart';
import 'package:online8_dars_animations/pages/tween_offset_slide.dart';
import 'package:online8_dars_animations/pages/tween_size_bounceIn.dart';

import 'CurvedAnimation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CurvedAnimationPage()));
                },
                child: Text("CurvedAnimation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TweenSize_BounceIn()));
                },
                child: Text("TweenSize_BounceIn Animation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TweenOffsetSlide()));
                },
                child: const Text("TweenOffsetSlide"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ForHinge()));
                },
                child: const Text("Hinge Animation"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => BounceAnimation()));
                },
                child: const Text("BounceAnimation"),
              ),
            ],
          ),
        ));
  }
}
