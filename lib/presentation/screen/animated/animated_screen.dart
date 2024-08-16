import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedScreen extends StatefulWidget {
  static const name = 'AnimatedScreen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 100.0;
  double height = 30.0;
  double borderRadius = 20;
  Color color = Colors.indigo;

  void changeshape() {
    final Random random = Random();

    width = random.nextInt(300) + 200;
    height = random.nextInt(300) + 200;
    borderRadius = random.nextInt(300) + 1;
    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animaciones en CONTAINER'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 4),
          curve: Curves.elasticOut,
          decoration: BoxDecoration(
              color: color,
              borderRadius:
                  BorderRadius.circular(borderRadius <= 0 ? 1 : borderRadius)),
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            changeshape();
          },
          child: const Icon(Icons.play_arrow_rounded)),
    );
  }
}
