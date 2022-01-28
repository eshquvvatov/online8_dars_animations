import 'package:flutter/material.dart';

import 'animatsiya_3D_flip_shablon_class.dart';

class ForHinge extends StatefulWidget {
  const ForHinge({Key? key}) : super(key: key);

  @override
  _ForHingeState createState() => _ForHingeState();
}

class _ForHingeState extends State<ForHinge>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 500),);
    _animationController.forward();
    _animationController.repeat(reverse: true);
  }
  @override void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
   
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hingle Animation"),
      ),
      // body: Hinge_Animation(child:Text("hinge animation")),
      body: Center(child: Flip3D(
          child: Image(
            image: AssetImage("assest/images/images.jpg"),
          ),
          controller: _animationController),)
    );
  }
}
