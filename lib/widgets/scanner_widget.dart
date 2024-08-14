import 'package:flutter/material.dart';

class ScannerAnimation extends AnimatedWidget {
  final double width;

  const ScannerAnimation(
    this.width, {
    Key? key,
    required Animation<double> animation,
  }) : super(
          key: key,
          listenable: animation,
        );

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    final scorePosition = (animation.value * 440) + 16;

    Color color1 = Colors.white;
    Color color2 = Colors.white;

    if (animation.status == AnimationStatus.reverse) {
      color1 = Colors.white;
      color2 = Colors.white;
    }

    return Positioned(
      bottom: scorePosition,
      left: 16.0,
      child: Opacity(
        opacity: 1.0,
        child: Container(
          height: 40.0,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.9],
              colors: [color1, color2],
            ),
          ),
        ),
      ),
    );
  }
} 