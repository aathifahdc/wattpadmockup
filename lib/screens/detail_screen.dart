import 'package:flutter/material.dart';
import '../models/story_model.dart';

/// Menampilkan halaman detail cerita.

class DetailScreen extends StatelessWidget {
  final Story story;

  const DetailScreen({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF500A),
        title: Text(
          story.title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Sampul Cerita
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                story.coverUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            /// Judul dan Penulis
            Text(
              story.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'by ${story.author}',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const Divider(height: 32),

            /// Isi Cerita
            Text(
              story.content,
              style: const TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
