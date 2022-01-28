import 'package:flutter/material.dart';

class TweenSize_BounceIn extends StatefulWidget {
  const TweenSize_BounceIn({Key? key}) : super(key: key);

  @override
  _TweenSize_BounceInState createState() => _TweenSize_BounceInState();
}

class _TweenSize_BounceInState extends State<TweenSize_BounceIn>with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Size> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    _animation = Tween<Size>(begin: Size(150, 150), end: Size(250, 250))
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.bounceIn));
    _animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _animationController.repeat( reverse: true);
      }
    });
  }
  @override void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TweenSize_BounceIn Animation"),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Image(
              image: AssetImage("assest/images/yurak.jpg"),
              fit: BoxFit.cover,
              height: _animation.value.height,
              width: _animation.value.width,
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.forward();
        },child: Icon(Icons.play_arrow),
      ),
    );
  }
}
