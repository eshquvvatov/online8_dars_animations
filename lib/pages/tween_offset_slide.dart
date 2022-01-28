import 'package:flutter/material.dart';

class TweenOffsetSlide extends StatefulWidget {
  const TweenOffsetSlide({Key? key}) : super(key: key);

  @override
  _TweenOffsetSlideState createState() => _TweenOffsetSlideState();
}

class _TweenOffsetSlideState extends State<TweenOffsetSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween<Offset>(begin: Offset.zero, end: Offset(1.5, 0)).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.elasticIn));

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TweenOffsetSlide Animation"),
        centerTitle: true,
      ),
      body: SlideTransition(
        position: _animation,
        child: Center(
          child: FlutterLogo(
            size: 200,
          ),
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
