import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // Controllers untuk mengontrol setiap TextField
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isAgree = false; // Untuk checkbox "Setuju dengan Syarat & Ketentuan"

  // Fungsi untuk mengecek apakah semua kolom sudah diisi
  bool isFormValid() {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        isAgree;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Buat Akun',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Isi informasi Anda di bawah atau daftar\ndengan akun sosial Anda.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Name Input
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Ex. John Doe',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Email Input
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'example@gmail.com',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Phone Number Input
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Nomor Telepon',
                  hintText: 'Ex. +62 812 3456 7890',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              // Password Input
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
              const SizedBox(height: 20),
              // Checkbox untuk syarat dan ketentuan
              Row(
                children: [
                  Checkbox(
                    value: isAgree,
                    onChanged: (value) {
                      setState(() {
                        isAgree = value ?? false;
                      });
                    },
                  ),
                  const Text('Setuju dengan '),
                  const Text(
                    'Syarat & Ketentuan',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Sign Up Button
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  onPressed: isFormValid()
                      ? () {
                          // Tampilkan snackbar dengan pesan "Pendaftaran Berhasil"
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Pendaftaran Berhasil'),
                              duration: Duration(seconds: 3),
                            ),
                          );
                          // Kembali ke halaman login
                          Navigator.pop(context);
                        }
                      : null, // Jika form tidak valid, tombol tidak aktif
                  child: const Text(
                    'Mendaftar',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Atau daftar dengan',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.apple, size: 40),
                  SizedBox(width: 20),
                  Icon(Icons.g_mobiledata, size: 40),
                  SizedBox(width: 20),
                  Icon(Icons.facebook, size: 40),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Sudah punya akun? Masuk',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
