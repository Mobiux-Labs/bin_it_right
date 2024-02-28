import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class ReverseProgressBar extends StatefulWidget {
  const ReverseProgressBar({super.key});

  @override
  State<ReverseProgressBar> createState() => _ReverseProgressBarState();
}

class _ReverseProgressBarState extends State<ReverseProgressBar> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ChangeNotifierProvider<TimeState>(
        create: (context) => TimeState(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<TimeState>(
              builder: (BuildContext context, timeState, Widget? child) =>
                  CustomProgressBar(
                width: MediaQuery.of(context).size.width,
                value: timeState.time,
                totalValue: 60,
              ),

            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<TimeState>(
              builder: (BuildContext context, timeState, Widget? child) =>
                  ElevatedButton(
                onPressed: () {
                  Timer.periodic(const Duration(seconds: 1), (timer) {
                    if (timeState.time == 0) {
                      timer.cancel();
                    } else {
                      timeState.time -= 1;
                    }
                  });
                },
                child: const Text('start'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar(
      {super.key,
      required this.width,
      required this.value,
      required this.totalValue});

  final double width;
  final int value;
  final int totalValue;

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey[400],
          ),
        ),
        Material(
          child: AnimatedContainer(
            height: 20,
            width: width * ratio,
            duration: const Duration(
              milliseconds: 500,
            ),
            decoration: BoxDecoration(
              color: (ratio < 0.5) ? Colors.red : Colors.lightGreen,
            ),
          ),
        ),
      ],
    );
  }
}

class TimeState with ChangeNotifier {
  int _time = 60;

  int get time => _time;

  set time(int newTime) {
    _time = newTime;
    notifyListeners();
  }
}
