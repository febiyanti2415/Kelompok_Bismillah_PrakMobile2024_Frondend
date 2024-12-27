import 'package:flutter/material.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Pesanan'),
      ),
      body: Column(
        children: [
          // Header dengan warna biru
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.blue,
            child: const Text(
              'Konfirmasi Pesanan',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Tabel
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(color: Colors.grey), // Tambahkan border
                  columns: const [
                    DataColumn(label: Text('No.', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('No. Pesanan', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Tipe Pesanan', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Pelanggan', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Sub Total', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Ongkir', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Total Pembayaran', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Opsi', style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: [
                    // Kosong, sama seperti pada gambar
                    for (int i = 1; i <= 5; i++) // Contoh data dinamis
                      DataRow(
                        cells: [
                          DataCell(Text('$i')),
                          DataCell(Text('ORD$i')),
                          const DataCell(Text('Produk')),
                          DataCell(Text('Pelanggan $i')),
                          DataCell(Text('Rp ${(100000 * i)}')),
                          DataCell(Text('Rp ${(10000 * i)}')),
                          DataCell(Text('Rp ${(110000 * i)}')),
                          DataCell(TextButton(
                            onPressed: () {},
                            child: const Text('Detail'),
                          )),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          // Tombol Konfirmasi di bagian bawah
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Aksi tombol konfirmasi
              },
              child: const Text('Konfirmasi'),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: OrderConfirmationPage()));
}
