import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk form input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Global key untuk form validation
  final _formKey = GlobalKey<FormState>();

  // Fungsi validasi email sederhana
  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  // Fungsi ketika tombol login ditekan
  void _handleLogin() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    // Validasi input kosong
    if (email.isEmpty || password.isEmpty) {
      _showSnackBar("Please fill in all fields");
      return;
    }

    // Validasi format email
    if (!_isValidEmail(email)) {
      _showSnackBar("Please enter a valid email address");
      return;
    }

    // ✅ Validasi password minimal 6 karakter
    if (password.length < 6) {
      _showSnackBar("Password must be at least 6 characters");
      return;
    }

    // Jika semua valid → login sukses
    Navigator.pushReplacementNamed(context, '/home');
  }

  // Snackbar pesan error
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,
            style: const TextStyle(color: Colors.white, fontSize: 14)),
        backgroundColor:  const Color(0xFFFF500A),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Logo Wattpad
            Image.asset(
              'assets/Wattpad_logo.png',
              width: 160,
            ),
            const SizedBox(height: 40),

            /// Form Login
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Input Email
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Input Password
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  //  Tombol Login
                  CustomButton(
                    text: "Log in",
                    onPressed: _handleLogin,
                  ),

                  const SizedBox(height: 15),
                  const Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
