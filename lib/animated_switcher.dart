import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({super.key});

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {
  bool _isFirstWidget = true;

  void _toggleWidget() {
    setState(() {
      _isFirstWidget = !_isFirstWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: _isFirstWidget
                  ? Container(
                      width: 100,
                      height: 100,
                      color: Colors.red,
                      child: const Center(child: Text('First Widget')),
                    )
                  : Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: const Center(child: Text('Second Widget')),
                    ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleWidget,
              child: const Text('Toggle Widget'),
            ),
          ],
        ),
      ),
    );
  }
}
