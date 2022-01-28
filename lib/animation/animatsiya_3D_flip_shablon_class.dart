import 'package:flutter/material.dart';

class Flip3D extends StatefulWidget {
  Widget child;
  late AnimationController controller;

  Flip3D({Key? key, required this.child,required this.controller}) : super(key: key);

  @override
  _Flip3DState createState() => _Flip3DState();
}

class _Flip3DState extends State<Flip3D> with SingleTickerProviderStateMixin {

  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animation = Tween(begin: 0.0, end: 1.0).animate(widget.controller)
      ..addListener(() {
        setState(() {});
      });

  }
  @override void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(2, 1, 0.005)
          ..rotateX(3.14 * (_animation.value)),
      child: widget.child,
    );
  }
}
