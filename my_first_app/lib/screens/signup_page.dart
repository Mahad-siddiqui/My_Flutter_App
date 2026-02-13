import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,     
      body:SafeArea(
        child:Center(
          child:SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal:30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                // header
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                // form
                  TextField(
                  decoration: InputDecoration(
                    hintText: 'Joanette_Russell66',
                    hintStyle: const TextStyle(
                      color: Color(0xFF5A6B7E),
                      fontSize: 14,
                    ),
                    labelText: 'Username',
                    labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 146, 155, 119),
                      fontSize: 12,
                    ),
                    fillColor: const Color.fromARGB(255, 198, 202, 203),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),

              ],
            )
          )
        )
      )
    );
  }
}
