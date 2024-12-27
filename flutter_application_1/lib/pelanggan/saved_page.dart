import 'package:flutter/material.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: Image.asset('assets/jersy_serena.jpeg', fit: BoxFit.cover),
              ),
              const SizedBox(height: 5),
              const Text("jersey serena", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Text("\$149.00", style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
