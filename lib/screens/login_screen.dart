import 'dart:ui';
import 'package:flutter/material.dart';
import 'crop_selection_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Full-screen background image
          Image.asset(
            'assets/images/login_bg.webp',
            fit: BoxFit.cover,
          ),

          // Apply LIGHT blur + very subtle overlay for transparency effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: const Color.fromRGBO(255, 255, 255, 0.05),
            ),
          ),

          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    const Text(
                      'Welcome Farmer',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Username field (glass)
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          color: const Color.fromRGBO(255, 255, 255, 0.25),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.grey[900],
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Enter your Nickname',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),

                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          color: const Color.fromRGBO(255, 255, 255, 0.25),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: TextField(
                            obscureText: true,
                            style: TextStyle(
                              color: Colors.grey[900],
                            ),
                            decoration: const InputDecoration(
                              hintText: 'Enter your Password',
                              hintStyle: TextStyle(
                                color: Colors.black54,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(22)),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                const CropSelectionScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color.fromRGBO(255, 255, 255, 0.25),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                              side: const BorderSide(
                                color: Color.fromRGBO(255, 255, 255, 0.35),
                                width: 1.2,
                              ),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Sign Up text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // TODO: navigate to Sign Up screen
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
