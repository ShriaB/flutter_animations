import 'package:flutter/material.dart';

class ListViewStaggeredAnimation extends StatefulWidget {
  const ListViewStaggeredAnimation({super.key});

  @override
  State<ListViewStaggeredAnimation> createState() =>
      _ListViewStaggeredAnimationState();
}

class _ListViewStaggeredAnimationState extends State<ListViewStaggeredAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late List<Animation<Offset>> staggeredAnimations;
  final itemCount = 5;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    staggeredAnimations = List.generate(
        itemCount,
        (index) => Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(
            CurvedAnimation(
                parent: animationController,
                curve: Interval(index * (1 / itemCount), 1))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View Animation"),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          if (animationController.isCompleted) {
            animationController.reverse();
          } else {
            animationController.forward();
          }
        },
        child: const Icon(Icons.animation),
      ),
      body: ListView(
        children: List.generate(
            5,
            (index) => SlideTransition(
                  position: staggeredAnimations[index],
                  child: ListTile(
                    title: Text("List Tile ${index + 1}"),
                  ),
                )),
      ),
    );
  }
}
