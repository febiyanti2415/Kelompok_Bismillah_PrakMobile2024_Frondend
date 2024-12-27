import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            leading: Image.asset('assets/jersy_serena.jpeg'),
            title: const Text("jersey serena"),
            subtitle: const Text("\$149.00"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {},
                ),
                const Text("1"),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text("Total:"),
            trailing: Text("\$149.00"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Checkout"),
          ),
        ],
      ),
    );
  }
}
