import 'package:flutter/material.dart';

class AnimatedGrowingCircle extends StatelessWidget {
  const AnimatedGrowingCircle({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Growing Circle"),
        ),
        body: Center(
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 200),
              duration: const Duration(seconds: 3),
              curve: Curves.bounceOut,
              builder: (context, size, widget) {
                return Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                            color: const Color.fromRGBO(187, 222, 251, 1),
                            spreadRadius: size / 2,
                            blurRadius: 50)
                      ]),
                );
              }),
        ));
  }
}
