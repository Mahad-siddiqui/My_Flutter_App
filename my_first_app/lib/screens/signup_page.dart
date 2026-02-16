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
      backgroundColor: const Color(0xFF1E3A5F),
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
                const SizedBox(height: 100),
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
                 const SizedBox(height: 16),
                 TextField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    hintStyle: const TextStyle(
                      color: Color(0xFF5A6B7E),
                      fontSize: 14,
                    ),
                    labelText: 'Password',
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
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color.fromARGB(255, 235, 242, 251),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'mahad',
                    hintStyle: const TextStyle(
                      color: Color(0xFF5A6B7E),
                      fontSize: 14,
                    ),
                    labelText: 'First Name',
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
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Siddiqui',
                    hintStyle: const TextStyle(
                      color: Color(0xFF5A6B7E),
                      fontSize: 14,
                    ),
                    labelText: 'Last Name',
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
                  const SizedBox(height: 80),
                  
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFC107),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have account? ",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xFFFFA726),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                

                

              ],
            )
          )
        )
      )
    );
  }
}
