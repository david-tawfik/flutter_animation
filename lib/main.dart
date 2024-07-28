import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Animated Foo Examples')),
        body: Center(
          child: AnimatedFooExample(),
        ),
      ),
    );
  }
}

class AnimatedFooExample extends StatefulWidget {
  @override
  _AnimatedFooExampleState createState() => _AnimatedFooExampleState();
}

class _AnimatedFooExampleState extends State<AnimatedFooExample> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.black;
  double _opacity = 1.0;

  void _animateContainer() {
    setState(() {
      _width = _width == 100.0 ? 200.0 : 100.0;
      _height = _height == 100.0 ? 200.0 : 100.0;
      _color = _color == Colors.black
          ? const Color.fromARGB(255, 164, 150, 20)
          : Colors.black;
    });
  }

  void _toggleOpacity() {
    setState(() {
      _opacity = _opacity == 1.0 ? 0.0 : 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.black,
          ),
        ),
        ElevatedButton(
          onPressed: _toggleOpacity,
          child: const Text('Toggle Opacity'),
        ),
      ],
    );
  }
}
