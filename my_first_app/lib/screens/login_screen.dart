import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'home_screen.dart';

// LoginScreen - Handles user login and signup
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers to get text from input fields
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  bool _isLogin = true; // true = login mode, false = signup mode
  String _message = ''; // To show success/error messages

  // Handle login button press
  Future<void> _handleLogin() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    // Validation
    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _message = 'Please fill all fields';
      });
      return;
    }

    // Try to login
    final user = await AuthService.login(username, password);

    if (user != null) {
      // Login successful - Navigate to home screen
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } else {
      setState(() {
        _message = 'Invalid username or password';
      });
    }
  }

  // Handle signup button press
  Future<void> _handleSignup() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    // Validation
    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _message = 'Please fill all fields';
      });
      return;
    }

    if (password.length < 4) {
      setState(() {
        _message = 'Password must be at least 4 characters';
      });
      return;
    }

    // Try to signup
    final success = await AuthService.signup(username, password);

    if (success) {
      setState(() {
        _message = 'Account created! Please login.';
        _isLogin = true; // Switch to login mode
      });
    } else {
      setState(() {
        _message = 'Username already exists';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Login' : 'Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App title
            const Text(
              'Todo App',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 40),

            // Username field
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 16),

            // Password field
            TextField(
              controller: _passwordController,
              obscureText: true, // Hide password
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 24),

            // Login/Signup button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLogin ? _handleLogin : _handleSignup,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  _isLogin ? 'Login' : 'Sign Up',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Toggle between login/signup
            TextButton(
              onPressed: () {
                setState(() {
                  _isLogin = !_isLogin;
                  _message = '';
                });
              },
              child: Text(
                _isLogin
                    ? 'Don\'t have an account? Sign Up'
                    : 'Already have an account? Login',
              ),
            ),

            // Message display (success/error)
            if (_message.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  _message,
                  style: TextStyle(
                    color: _message.contains('created') ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
