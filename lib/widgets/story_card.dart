// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/story_model.dart';

/// Widget ini digunakan untuk menampilkan satu kartu cerita
/// di halaman Discover. Berisi gambar cover, judul, dan penulis.

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔸 Gambar Cover
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            child: Image.asset(
              story.coverUrl,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),

          /// 🔸 Judul & Penulis
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  story.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  story.author,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
