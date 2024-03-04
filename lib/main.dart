import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // Adjust duration as needed
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {}); // Redraw widget on animation updates
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reset();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // First Image
          Positioned(
            top: -MediaQuery.of(context).size.height * _animation.value,
            left: 0,
            child: Image.asset(
              'assets/images/road.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 2,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          // Second Image
          Positioned(
            top: MediaQuery.of(context).size.height -
                MediaQuery.of(context).size.height * _animation.value,
            left: 0,
            child: Image.asset(
              'assets/images/road.png',
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 2,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
