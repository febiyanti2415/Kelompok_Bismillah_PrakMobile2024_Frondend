import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/tambahBaramg.dart';

class TambahProdukPage extends StatelessWidget {
  const TambahProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk Dan Hapus Produk'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigasi ke halaman tambah produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddProductPage()),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('+ Tambah Produk'),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                DataTable(
                  columns: const [
                    DataColumn(label: Text('No.')),
                    DataColumn(label: Text('Produk')),
                    DataColumn(label: Text('Deskripsi')),
                    DataColumn(label: Text('Harga Jual')),
                    DataColumn(label: Text('Gambar')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: [
                    DataRow(
                      cells: [
                        const DataCell(Text('1')),
                        const DataCell(Text('Jersey Serena')),
                        const DataCell(Text('hersesy yang sangat bagus')),
                        const DataCell(Text('Rp 89.200')),
                        DataCell(Image.asset(
                          'assets/jersy_serena.jpeg',
                          width: 50,
                          height: 50,
                        )),
                        DataCell(Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // Edit action
                              },
                              child: const Text('Edit'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Hapus action
                              },
                              child: const Text('Hapus'),
                            ),
                          ],
                        )),
                      ],
                    ),
                    // Tambahkan data lain jika perlu
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
