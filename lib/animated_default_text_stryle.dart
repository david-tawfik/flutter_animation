import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleWidget extends StatefulWidget {
  const AnimatedDefaultTextStyleWidget({super.key});

  @override
  State<AnimatedDefaultTextStyleWidget> createState() =>
      _AnimatedDefaultTextStyleWidgetState();
}

class _AnimatedDefaultTextStyleWidgetState
    extends State<AnimatedDefaultTextStyleWidget> {
  bool _isToggled = false;
  void _toggleTextStyle() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: Column(
          children: [
            AnimatedDefaultTextStyle(
              style: _isToggled
                  ? const TextStyle(
                      fontSize: 40,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    )
                  : const TextStyle(
                      fontSize: 20,
                      color: Colors.blue,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
              duration: const Duration(seconds: 1),
              child: const Text('Animated Text Style'),
            ),
            ElevatedButton(
              onPressed: _toggleTextStyle,
              child: const Text('Toggle Text Style'),
            ),
          ],
        ),
      ),
    );
  }
}
