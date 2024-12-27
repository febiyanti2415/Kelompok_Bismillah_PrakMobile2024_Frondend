import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => const LoginPage(),
        '/profile_page': (context) => const ProfilePage(),
        '/home_page': (context) => const HomePage(),
      },
    );
  }
}

// Halaman Login
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/profile_page');
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}

// Halaman Profil
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  String selectedGender = 'Male';

  // Daftar pesan notifikasi
  List<Message> messages = [
    Message(sender: "Admin", content: "Selamat datang di aplikasi kami."),
    Message(sender: "Support", content: "Jangan lupa lengkapi profil Anda."),
  ];

  @override
  void initState() {
    super.initState();
    emailController.text = " ";
    phoneController.text = " ";
    addressController.text = " ";
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void saveProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Profile updated successfully!"),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showNotifications() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Notifikasi"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return ListTile(
                  title: Text(message.sender),
                  subtitle: Text(message.content),
                  trailing: message.isRead
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : const Icon(Icons.notifications, color: Colors.red),
                  onTap: () {
                    setState(() {
                      messages[index].markAsRead();
                    });
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tutup"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.green,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: _showNotifications,
              ),
              if (messages.any((message) => !message.isRead))
                Positioned(
                  right: 11,
                  top: 11,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${messages.where((message) => !message.isRead).length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.purple,
              child: Icon(Icons.camera_alt, color: Colors.white, size: 24),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: "Your Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
              labelText: "Your Phone",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: addressController,
            decoration: InputDecoration(
              labelText: "Alamat",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: selectedGender,
            decoration: InputDecoration(
              labelText: "Jenis Kelamin",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Male',
                child: Text('Male'),
              ),
              DropdownMenuItem(
                value: 'Female',
                child: Text('Female'),
              ),
              DropdownMenuItem(
                value: 'Other',
                child: Text('Other'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedGender = value!;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: saveProfile,
            child: const Text("Save Profile"),
          ),
          const SizedBox(height: 20),
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
    );
  }
}

// Model Pesan
class Message {
  final String sender;
  final String content;
  bool isRead;

  Message({
    required this.sender,
    required this.content,
    this.isRead = false,
  });

  void markAsRead() {
    isRead = true;
  }
}
