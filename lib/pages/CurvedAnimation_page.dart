import 'package:flutter/material.dart';

class CurvedAnimationPage extends StatefulWidget {
  const CurvedAnimationPage({Key? key}) : super(key: key);

  @override
  _CurvedAnimationPageState createState() => _CurvedAnimationPageState();
}

class _CurvedAnimationPageState extends State<CurvedAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Curved Animation",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const Image(
            image: AssetImage("assest/images/images.jpg"),
           fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },child: Icon(Icons.play_arrow),
      ),
    );
  }
}
