import 'package:flutter/material.dart';

class Hinge_Animation extends StatefulWidget {
  final Widget child;

  Hinge_Animation({Key? key, required this.child}) : super(key: key);

  @override
  _Hinge_AnimationState createState() => _Hinge_AnimationState();
}

class _Hinge_AnimationState extends State<Hinge_Animation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _rotateAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    _rotateAnimation = Tween<double>(begin: 0.0, end: 0.15).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

    _slideAnimation = Tween(begin: 100.0, end: 600.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.forward();
      },
      child: AnimatedBuilder(
        builder: (BuildContext context, ch) {
          return Center(child: Container(
            width: 220,
            height: 220,

            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 5, top: _slideAnimation.value),
            child: RotationTransition(
              turns: _rotateAnimation,
              child:Text(
                widget.child.toString(),
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 126, _opacityAnimation.value)),
              ),
            ),
          ),);
        },
        animation: _slideAnimation,
      ),
    );
  }
}
