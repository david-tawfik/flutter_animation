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

  void _animateContainer() {
    setState(() {
      _width = _width == 100.0 ? 200.0 : 100.0;
      _height = _height == 100.0 ? 200.0 : 100.0;
      _color = _color == Colors.black ? const Color.fromARGB(255, 164, 150, 20) : Colors.black;
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
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _animateContainer,
          child: Text('Animate Container'),
        ),
      ],
    );
  }
}
