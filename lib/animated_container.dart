import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.black;

  void _animateContainer() {
    setState(() {
      _width = _width == 100.0 ? 200.0 : 100.0;
      _height = _height == 100.0 ? 200.0 : 100.0;
      _color = _color == Colors.black
          ? const Color.fromARGB(255, 164, 150, 20)
          : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              width: _width,
              height: _height,
              color: _color,
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            ElevatedButton(
              onPressed: _animateContainer,
              child: const Text('Animate Container'),
            ),
          ],
        ),
      ),
    );
  }
}
