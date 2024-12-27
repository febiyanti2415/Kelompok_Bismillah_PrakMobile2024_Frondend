import 'package:flutter/material.dart';

class ProductManagementPage extends StatelessWidget {
  const ProductManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kelola Produk')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Tambah Produk'),
            onTap: () {
              // Tambahkan logika tambah produk
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Hapus Produk'),
            onTap: () {
              // Tambahkan logika hapus produk
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Buat Pesanan Produk'),
            onTap: () {
              // Tambahkan logika buat pesanan
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.design_services),
            title: const Text('Kelola Desain Produk'),
            onTap: () {
              // Tambahkan logika kelola desain
            },
          ),
        ],
      ),
    );
  }
}
