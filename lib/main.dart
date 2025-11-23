import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'models/story_model.dart';

void main() {
  runApp(const MyApp());
}

/// Entry point aplikasi Wattpad Clone
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marie Wattpad Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),

      /// Routing sistem
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/detail': (context) {
          final story = ModalRoute.of(context)!.settings.arguments as Story;
          return DetailScreen(story: story);
        },
      },
    );
  }
}
