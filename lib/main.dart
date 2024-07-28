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
  bool _isToggled = false;
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = [];

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

  void _toggleTextStyle() {
    setState(() {
      _isToggled = !_isToggled;
    });
  }

  void _addItem() {
    setState(() {
      _items.insert(0, "Item ${_items.length + 1}");
      _listKey.currentState?.insertItem(0, duration: const Duration(seconds: 1));
    });
  }

  void _removeItem(int index) {
    setState(() {
      String removedItem = _items.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => _buildItem(removedItem, animation),
        duration: const Duration(seconds: 1),
      );
    });
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(item),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _removeItem(_items.indexOf(item));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
          ElevatedButton(
              onPressed: _addItem,
              child: Text('Add Item'),
            ),
          SizedBox(
              height: 200,
              child: AnimatedList(
                key: _listKey,
                initialItemCount: _items.length,
                itemBuilder: (context, index, animation) {
                  return _buildItem(_items[index], animation);
                },
              ),
            ),
        ],
      ),
    );
  }
}
