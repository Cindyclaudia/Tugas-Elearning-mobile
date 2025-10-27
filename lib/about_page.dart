import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Aplikasi mini ini dibuat menggunakan Flutter.\n\n'
          'Fitur:\n'
          '- Form input sederhana (nama, email, telepon)\n'
          '- Navigasi antar halaman\n'
          '- Tema otomatis dan manual (gelap / terang)\n'
          '- Gambar dari URL',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
