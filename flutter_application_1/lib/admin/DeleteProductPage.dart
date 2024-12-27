import 'package:flutter/material.dart';

class DeleteProductPage extends StatelessWidget {
  const DeleteProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hapus Produk'),
      ),
      body: const Center(
        child: Text(
          'Halaman untuk Menghapus Produk',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
