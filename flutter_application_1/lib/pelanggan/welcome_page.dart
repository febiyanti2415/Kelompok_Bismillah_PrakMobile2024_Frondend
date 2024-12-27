import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_page.dart';
import 'registration_page.dart'; // Import halaman RegistrationPage

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar di tengah halaman
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/download.jpeg', // Path gambar
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Judul halaman
            const Text(
              'Jersey Impian',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Temukan Beragam Jersey Berkualitas untuk Kebutuhan Anda Sekarang!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Tombol "Jelajahi Sekarang!" - Tampilkan dialog
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Apakah Anda sudah mempunyai akun?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: const Text('Silahkan login'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Tutup dialog
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  const LoginPage()),
                                        );
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Ya'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Tutup dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: const Text('Silahkan registrasi'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context); // Tutup dialog
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const RegistrationPage()),
                                        );
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Tidak'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'Jelajahi Sekarang!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),

      // BottomNavigationBar untuk "Masuk" dan "Registrasi"
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Tombol "Masuk" - Menuju LoginPage
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  'Masuk',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Garis pemisah
              const Text(
                '|',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),

              // Tombol "Registrasi" - Menuju RegistrationPage
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegistrationPage()),
                  );
                },
                child: const Text(
                  'Registrasi',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
