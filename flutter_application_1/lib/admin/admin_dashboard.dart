import 'package:flutter/material.dart';
import 'package:flutter_application_1/admin/AddProductPage.dart';
import 'package:flutter_application_1/admin/OrderProductPage.dart';
import 'package:flutter_application_1/screens/login_page.dart';
import 'edit_profile_admin.dart';
import 'package:flutter_application_1/screens/home_page.dart';

class Message {
  final String sender;
  final String content;
  final bool isRead;
  final List<String> replies;

  Message({
    required this.sender,
    required this.content,
    this.isRead = false,
    this.replies = const [],
  });

  Message addReply(String reply) {
    return Message(
      sender: sender,
      content: content,
      isRead: isRead,
      replies: List.from(replies)..add(reply),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Message> messages = [
    Message(sender: "Pelanggan 1", content: "Halo, ada pertanyaan tentang produk."),
    Message(sender: "Pelanggan 2", content: "Apakah produk ini tersedia?", isRead: true),
  ];

  int get unreadMessagesCount => messages.where((msg) => !msg.isRead).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  _showMessages(context);
                },
              ),
              if (unreadMessagesCount > 0)
                Positioned(
                  right: 10,
                  top: 10,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      unreadMessagesCount.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Admin Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ExpansionTile(
              leading: const Icon(Icons.production_quantity_limits),
              title: const Text('Kelola Produk'),
              children: [
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text('Tambah Produk dan Hapus Produk'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TambahProdukPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Buat Pesanan Produk'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OrderConfirmationPage()),
                    );
                  },
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const EditProfileApp()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16.0),
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                _buildDashboardItem(
                  icon: Icons.production_quantity_limits,
                  title: 'Tambah & Hapus Produk',
                  count: '',
                  color: Colors.green,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TambahProdukPage()),
                    );
                  },
                ),
                _buildDashboardItem(
                  icon: Icons.edit,
                  title: 'Edit Profil',
                  count: '',
                  color: Colors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const EditProfileApp()),
                    );
                  },
                ),
                _buildDashboardItem(
                  icon: Icons.shopping_cart,
                  title: 'Pesanan Produk',
                  count: '',
                  color: Colors.orange,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const OrderConfirmationPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              tooltip: "Keluar",
              child: const Icon(Icons.exit_to_app),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem({
    required IconData icon,
    required String title,
    required String count,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            const SizedBox(height: 10),
            if (count.isNotEmpty)
              Text(
                count,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showMessages(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pesan dari Pelanggan'),
          content: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(message.sender),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(message.content),
                      if (message.replies.isNotEmpty)
                        ...message.replies.map((reply) => Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                'Balasan: $reply',
                                style: const TextStyle(fontStyle: FontStyle.italic),
                              ),
                            )),
                    ],
                  ),
                  trailing: message.isRead
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(Icons.markunread, color: Colors.red),
                  onTap: () {
                    setState(() {
                      messages[index] = Message(
                        sender: message.sender,
                        content: message.content,
                        isRead: true,
                        replies: message.replies,
                      );
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }
}

