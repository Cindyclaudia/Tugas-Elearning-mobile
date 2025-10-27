import 'package:flutter/material.dart';
import 'about_page.dart';

class HomePage extends StatefulWidget {
  final void Function(ThemeMode) onThemeChanged;
  final ThemeMode themeMode;

  const HomePage({
    super.key,
    required this.onThemeChanged,
    required this.themeMode,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nama = '';
  String email = '';
  String telepon = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pengguna'),
        actions: [
          // 🌗 Tombol ganti tema
          PopupMenuButton<String>(
            icon: const Icon(Icons.color_lens_outlined),
            onSelected: (value) {
              switch (value) {
                case 'Terang':
                  widget.onThemeChanged(ThemeMode.light);
                  break;
                case 'Gelap':
                  widget.onThemeChanged(ThemeMode.dark);
                  break;
                case 'Sistem':
                  widget.onThemeChanged(ThemeMode.system);
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'Terang', child: Text('Mode Terang')),
              const PopupMenuItem(value: 'Gelap', child: Text('Mode Gelap')),
              const PopupMenuItem(value: 'Sistem', child: Text('Ikuti Sistem')),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🖼️ Logo dari Wikipedia
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/8/86/Universitas_Teknologi_Bandung_Logo.png',
                height: 180,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Gagal memuat gambar 😢',
                    style: TextStyle(color: Colors.red),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // 📋 Form Input
            TextField(
              decoration: const InputDecoration(labelText: 'Nama'),
              onChanged: (value) => setState(() => nama = value),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => setState(() => email = value),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Telepon'),
              keyboardType: TextInputType.phone,
              onChanged: (value) => setState(() => telepon = value),
            ),
            const SizedBox(height: 30),

            const Divider(),
            Text(
              'Data Anda:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text('Nama: $nama'),
            Text('Email: $email'),
            Text('Telepon: $telepon'),
          ],
        ),
      ),
    );
  }
}
