import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  const BounceAnimation({Key? key}) : super(key: key);

  @override
  _BounceAnimationState createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000));

    _animation = Tween<double>(begin: 700.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.5, 1.0, curve: Curves.elasticIn)))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat(reverse: true);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: AnimatedBuilder(animation:_animation ,
          builder: (BuildContext context, ch) {
            return Container(child: Image(image:AssetImage("assest/images/koptok.jpg") ,),
              width: 100,
              height: 100,
              margin: EdgeInsets.only(top:_animation.value,left: 125),
            );
          },

        ),
        onTap: (){
          _animationController.forward();
        },
      )
    );
  }
}
