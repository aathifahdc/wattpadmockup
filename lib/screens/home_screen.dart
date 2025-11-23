import 'package:flutter/material.dart';
import '../models/story_model.dart';
import '../widgets/story_card.dart';

/// Halaman ini berfungsi untuk menampilkan daftar cerita

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    /// Setiap objek bertipe `Story` dan berisi judul, penulis, gambar, serta isi cerita.
    final List<Story> stories = [
      Story(
        title: 'My Arogant Boy',
        author: 'ugiysobber',
        coverUrl: 'assets/arogant_boy.jpg',
        content:
            'When Dece transfers to a new school, the last thing she expects is to cross paths with Na Jaemin — the most popular, handsome, and infuriatingly arrogant boy on campus. He has everything: looks, brains, and a fan club that worships him. But when a twist of fate forces them to work together, Dece begins to see the cracks behind his perfect image. Maybe arrogance is just his armor... and maybe, just maybe, she’s the only one who can break through it.',
      ),
      Story(
        title: 'Online Crush',
        author: 'malsyholmes',
        coverUrl: 'assets/online_crush.jpg',
        content:
            'Chey never thought a random message from a stranger named “Vee” would turn her quiet nights into something she secretly lived for. Every chat, every late-night call, every shared secret made her feel closer to him — the mysterious boy who somehow understood her better than anyone else. But when “Vee” insists they meet in person, Chey’s world flips upside down. Because behind the screen isn’t just some ordinary guy… it’s Kim Taehyung, global idol and the one person she was never supposed to fall for.',
      ),
      Story(
        title: 'Distracted',
        author: 'lblie',
        coverUrl: 'assets/distracted.jpg',
        content:
            'Bie had only one rule — stay focused and never get involved with dangerous men. But rules don’t mean much when Min Yoongi, the cold and calculating mafia boss, sets his eyes on you. He’s everything she should run from: ruthless, powerful, and untouchably calm. Yet beneath his deadly silence hides a man haunted by chaos… and for reasons she doesn’t understand, Bie becomes the one thing that makes him lose control — his greatest weakness, his sweetest distraction.',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white, // latar belakang putih
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF500A), 
        elevation: 0, // tanpa bayangan (flat)
        centerTitle: false, // posisi judul rata kiri
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'Discover', // teks judul appbar
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),

      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: stories.length, // jumlah cerita sesuai list dummy
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final story = stories[index];

          /// GestureDetector digunakan agar setiap card bisa diklik
          /// Saat diklik, akan diarahkan ke halaman detail dengan membawa data `story`.
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail', // route menuju halaman detail
                arguments: story, // kirim data cerita ke halaman berikutnya
              );
            },
            child: StoryCard(story: story), // panggil widget StoryCard (desain kartu)
          );
        },
      ),
    );
  }
}
