import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar (Logo & Language Selector)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.eco, color: Color(0xFF2DD4BF), size: 36),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Text("🇺🇸 English",
                            style:
                                TextStyle(color: Colors.white, fontSize: 13)),
                        SizedBox(width: 4),
                        Icon(Icons.unfold_more,
                            color: Colors.white54, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Title Header
              const Text(
                "Sign Up",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                "Your Fitness Journey Starts Here.",
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
              const SizedBox(height: 30),

              // Email Field
              _buildTextField(
                  hintText: "Email Address", icon: Icons.email_outlined),
              const SizedBox(height: 16),

              // Password Field
              _buildTextField(
                  hintText: "Password",
                  icon: Icons.lock_outline,
                  obscureText: true),
              const SizedBox(height: 16),

              // Confirm Password Field
              _buildTextField(
                  hintText: "Confirm Password",
                  icon: Icons.lock_outline,
                  obscureText: true),
              const SizedBox(height: 24),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2DD4BF),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  onPressed: () {
                    // TODO: Hook up Hive Auth / Registration Logic
                  },
                  child: const Text("Sign Up",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 16),

              // Terms & Conditions notice
              const Center(
                child: Text(
                  "By signing up, you agree to our Privacy Policy and Terms and Conditions.",
                  style: TextStyle(color: Colors.white54, fontSize: 11),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),

              // OR divider
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.white24)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("OR",
                        style: TextStyle(color: Colors.white54, fontSize: 12)),
                  ),
                  Expanded(child: Divider(color: Colors.white24)),
                ],
              ),
              const SizedBox(height: 24),

              // Google Sign In Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white24),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata,
                      color: Colors.white, size: 28),
                  label: const Text("Continue with Google",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                ),
              ),
              const SizedBox(height: 30),

              // Already have an account text link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? ",
                      style: TextStyle(color: Colors.white60, fontSize: 14)),
                  GestureDetector(
                    onTap: () {
                      // Navigate back or to Sign In view
                    },
                    child: const Text(
                      "Sign In.",
                      style: TextStyle(
                          color: Color(0xFF2DD4BF),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String hintText,
      required IconData icon,
      bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white54),
        suffixIcon: obscureText
            ? const Icon(Icons.visibility_off, color: Colors.white54)
            : null,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: const Color(0xFF1E1E1E),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
