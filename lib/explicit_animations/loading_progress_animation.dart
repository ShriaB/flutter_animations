import 'package:flutter/material.dart';

class LoadingProgressAnimation extends StatefulWidget {
  final double progressLimit;
  final Color loaderColor;

  const LoadingProgressAnimation(this.progressLimit, this.loaderColor,
      {super.key});

  @override
  State<LoadingProgressAnimation> createState() =>
      _LoadingProgressAnimationState();
}

class _LoadingProgressAnimationState extends State<LoadingProgressAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animationProgress;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animationProgress = Tween(begin: 0.0, end: widget.progressLimit)
        .animate(animationController);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Animation"),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: animationProgress,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: CircularProgressIndicator(
                      value: animationProgress.value,
                      color: widget.loaderColor,
                      backgroundColor: Colors.grey.shade100,
                      strokeCap: StrokeCap.round,
                      strokeWidth: 8,
                    ),
                  ),
                  Text(
                    "${(animationProgress.value * 100).toInt()}%",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              );
            }),
      ),
    );
  }
}
