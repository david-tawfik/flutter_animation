import 'package:flutter/material.dart';

class AnimatedPositionedWidget extends StatefulWidget {
  const AnimatedPositionedWidget({super.key});

  @override
  State<AnimatedPositionedWidget> createState() =>
      _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool _isTopLeft = true;
  void _togglePosition() {
    setState(() {
      _isTopLeft = !_isTopLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.grey.shade200,
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        top: _isTopLeft ? 0 : 250,
                        left: _isTopLeft ? 0 : 250,
                        duration: const Duration(seconds: 1),
                        child: Container(
                          width: 50,
                          height: 50,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _togglePosition,
              child: const Text('Toggle Position'),
            ),
          ],
        ),
      ),
    );
  }
}
