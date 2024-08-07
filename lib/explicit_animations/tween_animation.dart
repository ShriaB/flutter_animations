import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationaController;
  late Animation<double> opacityAnimation;
  late Animation<Offset> slideAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    animationaController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    opacityAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationaController);

    slideAnimation = Tween(begin: const Offset(-1, -1), end: Offset.zero)
        .animate(animationaController);

    scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationaController, curve: Curves.easeIn));

    scaleAnimation.addListener(() {
      if (scaleAnimation.isCompleted) {
        animationaController.reverse();
      }
    });

    animationaController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fade in Animation"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: opacityAnimation,
              child: const Icon(
                Icons.location_city,
                size: 50,
              ),
            ),
            SlideTransition(
              position: slideAnimation,
              child: const Icon(
                Icons.location_city,
                size: 50,
              ),
            ),
            ScaleTransition(
              scale: scaleAnimation,
              child: const Icon(
                Icons.location_city,
                size: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
