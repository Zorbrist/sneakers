import 'package:flutter/material.dart';

/*void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: ShoppingCart(),
  ));
}*/

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('First route'),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: const Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
