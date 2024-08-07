import 'package:flutter/material.dart';

class AnimatedShoppingCartButton extends StatefulWidget {
  const AnimatedShoppingCartButton({super.key});

  @override
  State<AnimatedShoppingCartButton> createState() =>
      _AnimatedShoppingCartButtonState();
}

class _AnimatedShoppingCartButtonState
    extends State<AnimatedShoppingCartButton> {
  late BoxDecoration _containerDecoration;
  late Widget _containerChild;
  late double _width;
  bool isCartVisible = true;

  _getCartStyle() {
    _containerDecoration = BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(10));
    _containerChild = const Icon(
      Icons.shopping_cart,
      color: Colors.white,
    );
    _width = 50;
  }

  _getTextStyle() {
    _containerDecoration = BoxDecoration(
        color: Colors.green, borderRadius: BorderRadius.circular(30));
    _containerChild = const Row(
      children: [
        Icon(
          Icons.check,
          color: Colors.white,
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            "Added to Cart",
            style: TextStyle(
              color: Colors.white,
              overflow: TextOverflow.clip,
            ),
            softWrap: false,
          ),
        ),
      ],
    );
    _width = 150;
  }

  @override
  void initState() {
    _getCartStyle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Shopping Cart"),
      ),
      body: Center(
        child: GestureDetector(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            decoration: _containerDecoration,
            width: _width,
            padding: const EdgeInsets.all(10),
            child: _containerChild,
          ),
          onTap: () {
            if (isCartVisible) {
              _getTextStyle();
              isCartVisible = false;
            } else {
              _getCartStyle();
              isCartVisible = true;
            }
            setState(() {});
          },
        ),
      ),
    );
  }
}
