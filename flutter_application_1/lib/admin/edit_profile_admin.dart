import 'package:flutter/material.dart';
import 'admin_dashboard.dart'; // Pastikan file ini mengarah ke halaman admin

void main() {
  runApp(const EditProfileApp());
}

class EditProfileApp extends StatelessWidget {
  const EditProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditProfileScreen(),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set default values (optional)
    emailController.text = " ";
    phoneController.text = " ";
    cityController.text = " ";
    countryController.text = " ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            // Navigasi kembali ke DashboardPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const DashboardPage()),
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Tambahkan fungsi simpan di sini
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Profile saved successfully!")),
              );
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile_placeholder.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildTextField("Your Email", emailController, false),
            buildTextField("Your Password", passwordController, true),
            buildTextField("Your Phone", phoneController, false),
            buildTextField("City, State", cityController, false),
            buildTextField("Country", countryController, false),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, TextEditingController controller, bool isPassword) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    cityController.dispose();
    countryController.dispose();
    super.dispose();
  }
}
