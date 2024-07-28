import 'package:flutter/material.dart';

import 'animated_container.dart';
import 'animated_default_text_stryle.dart';
import 'animated_list.dart';
import 'animated_opacity.dart';
import 'animated_positioned.dart';
import 'animated_switcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Animated Foo Examples')),
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnimatedContainerWidget()),
              );
            },
            child: const Text('Animated Container'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnimatedPositionedWidget()),
              );
            },
            child: const Text('Animated Positioned'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnimatedOpacityWidget()),
              );
            },
            child: const Text('Animated Opacity'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnimatedListWidget()),
              );
            },
            child: const Text('Animated List'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const AnimatedDefaultTextStyleWidget()),
              );
            },
            child: const Text('Animated Default Text Style'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AnimatedSwitcherWidget()),
              );
            },
            child: const Text('Animated Switcher'),
          ),
        ],
      ),
    );
  }
}
