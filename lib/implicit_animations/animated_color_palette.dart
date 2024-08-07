import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedColorPalette extends StatefulWidget {
  const AnimatedColorPalette({super.key});

  @override
  State<AnimatedColorPalette> createState() => _AnimatedColorPaletteState();
}

class _AnimatedColorPaletteState extends State<AnimatedColorPalette> {
  late List<Color> _colors = generateColorPalette();
  List<Color> generateColorPalette() {
    final random = Random();
    return List.generate(
        5,
        (index) => Color.fromRGBO(
            random.nextInt(256), random.nextInt(256), random.nextInt(256), 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Color Palette"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var color in _colors)
              AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                height: 100,
                width: 100,
                color: color,
                margin: const EdgeInsets.all(12),
              ),
            ElevatedButton(
                onPressed: () => setState(() {
                      _colors = generateColorPalette();
                    }),
                child: const Text("Generate new Colors"))
          ],
        ),
      ),
    );
  }
}
