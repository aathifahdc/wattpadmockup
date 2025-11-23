/// Model data untuk menyimpan informasi cerita.
/// Digunakan di HomeScreen dan DetailScreen.
class Story {
  final String title;     // Judul cerita
  final String author;    // Nama penulis
  final String coverUrl;  // Path gambar cover (dari assets)
  final String content;   // Isi cerita

  Story({
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.content,
  });
}
