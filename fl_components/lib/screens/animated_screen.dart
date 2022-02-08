import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void changeShape() {
    setState(() {
      final random = Random();

      _width = random.nextInt(200).toDouble();
      _height = random.nextInt(200).toDouble();

      _color = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);

      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          duration: const Duration(seconds: 1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outline_outlined, size: 35),
        onPressed: () {
          changeShape();
        },
      ),
    );
  }
}
