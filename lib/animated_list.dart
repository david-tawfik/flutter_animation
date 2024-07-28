import 'package:flutter/material.dart';

class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({super.key});

  @override
  State<AnimatedListWidget> createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<String> _items = [];

  void _addItem() {
    setState(() {
      _items.insert(0, "Item ${_items.length + 1}");
      _listKey.currentState
          ?.insertItem(0, duration: const Duration(seconds: 1));
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
          icon: const Icon(Icons.delete),
          onPressed: () {
            _removeItem(_items.indexOf(item));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated Container')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addItem,
              child: const Text('Add Item'),
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
      ),
    );
  }
}
