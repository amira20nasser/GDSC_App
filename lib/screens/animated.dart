import 'package:flutter/material.dart';

class Animation_Task extends StatefulWidget {
  const Animation_Task({super.key});

  @override
  State<Animation_Task> createState() => _Animation_Task();
}

class _Animation_Task extends State<Animation_Task> {
  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 42, 77),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 68, 68, 68),
        elevation: 0,
        title: const Center(
          child: Text(
            'Flutter App',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              _addItem();
            },
          ),
          Expanded(
            child: AnimatedList(
              key: _key,
              initialItemCount: 0,
              itemBuilder: (context, index, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          color: const Color.fromARGB(255, 215, 165, 91),
                          height: 50,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                _items[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const Spacer(
                                flex: 2,
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  _removeItem(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addItem() {
    _items.insert(0, "Item ${_items.length + 1}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Container(
          width: 700,
          margin: EdgeInsets.all(10),
          color: Colors.red,
          padding: EdgeInsets.all(10),
          child: Text(
            "Deleted",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 300));

    _items.removeAt(index);
  }
}
