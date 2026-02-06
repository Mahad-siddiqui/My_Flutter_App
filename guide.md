# Flutter Development Guide for MERN Developers

Welcome! This guide will help you transition from MERN stack to Flutter by comparing familiar concepts and teaching you where everything goes in a Flutter project.

---

## 📚 Table of Contents

1. [MERN vs Flutter Overview](#mern-vs-flutter-overview)
2. [Project Structure Comparison](#project-structure-comparison)
3. [Complete Folder Structure Explained](#complete-folder-structure-explained)
4. [Where to Code What](#where-to-code-what)
5. [Creating Components (Widgets)](#creating-components-widgets)
6. [Creating Pages (Screens)](#creating-pages-screens)
7. [API Calling & Services](#api-calling--services)
8. [State Management](#state-management)
9. [Data Models](#data-models)
10. [Routing & Navigation](#routing--navigation)
11. [Complete Example Project](#complete-example-project)
12. [Common Patterns](#common-patterns)

---

## 🔄 MERN vs Flutter Overview

### MERN Stack
```
Frontend (React)  →  REST API  →  Backend (Node.js/Express)  →  Database (MongoDB)
     ↓                                        ↓
   State (Redux)                        Controllers/Routes
     ↓
Components/Pages
```

### Flutter
```
Flutter App  →  HTTP Client  →  REST API  →  Backend (Your existing Node.js API)
    ↓                                          ↓
Providers/Bloc                           Same as before
    ↓
Widgets/Screens
```

**Key Point:** Flutter replaces only your React frontend. Your Node.js backend stays the same!

---

## 📊 Project Structure Comparison

### MERN (React) Structure
```
my-react-app/
├── src/
│   ├── components/       # Reusable UI components
│   ├── pages/            # Full page components
│   ├── services/         # API calls (axios)
│   ├── context/          # Context API
│   ├── redux/            # Redux store
│   ├── utils/            # Helper functions
│   ├── styles/           # CSS files
│   ├── App.js            # Root component
│   └── index.js          # Entry point
├── public/
│   └── index.html
└── package.json          # Dependencies
```

### Flutter Structure
```
my_flutter_app/
├── lib/                  # All your code goes here
│   ├── widgets/          # Reusable UI components
│   ├── screens/          # Full page components
│   ├── services/         # API calls (http package)
│   ├── providers/        # State management (like Context/Redux)
│   ├── models/           # Data models (TypeScript interfaces)
│   ├── utils/            # Helper functions
│   ├── constants/        # Constants (colors, strings, URLs)
│   ├── config/           # Configuration (theme, etc.)
│   └── main.dart         # Entry point (like index.js)
├── assets/               # Images, fonts (like public/)
├── pubspec.yaml          # Dependencies (like package.json)
└── android/ios/web/      # Platform-specific code
```

---

## 🗂️ Complete Folder Structure Explained

### ✅ **lib/** - Your Main Code Directory
This is where ALL your Dart code lives. Think of it as the `src/` folder in React.

```
lib/
├── main.dart              # Entry point - like index.js or App.js
│
├── screens/               # Full Pages
│   ├── home/
│   │   ├── home_screen.dart
│   │   └── home_widgets.dart
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── signup_screen.dart
│   ├── profile/
│   │   └── profile_screen.dart
│   └── dashboard/
│       └── dashboard_screen.dart
│
├── widgets/               # Reusable Components
│   ├── common/
│   │   ├── custom_button.dart
│   │   ├── custom_text_field.dart
│   │   ├── loading_spinner.dart
│   │   └── custom_card.dart
│   ├── layouts/
│   │   ├── app_bar.dart
│   │   └── drawer.dart
│   └── forms/
│       └── input_field.dart
│
├── models/                # Data Models
│   ├── user.dart
│   ├── product.dart
│   ├── order.dart
│   └── api_response.dart
│
├── services/              # API & Business Logic
│   ├── api/
│   │   ├── api_client.dart      # Base HTTP client
│   │   ├── auth_api.dart        # Auth endpoints
│   │   ├── user_api.dart        # User endpoints
│   │   └── product_api.dart     # Product endpoints
│   ├── storage_service.dart     # Local storage (like localStorage)
│   └── auth_service.dart        # Authentication logic
│
├── providers/             # State Management
│   ├── auth_provider.dart
│   ├── user_provider.dart
│   ├── cart_provider.dart
│   └── theme_provider.dart
│
├── utils/                 # Helper Functions
│   ├── validators.dart          # Form validation
│   ├── formatters.dart          # Date/number formatting
│   ├── helpers.dart             # General utilities
│   └── logger.dart              # Logging
│
├── constants/             # App Constants
│   ├── api_constants.dart       # API URLs and endpoints
│   ├── app_colors.dart          # Color palette
│   ├── app_strings.dart         # Text strings
│   ├── app_routes.dart          # Route names
│   └── app_images.dart          # Image paths
│
└── config/                # Configuration
    ├── theme.dart               # App theme (colors, fonts)
    ├── routes.dart              # Route definitions
    └── environment.dart         # Environment variables
```

### ✅ **assets/** - Static Files
Like the `public/` folder in React. Put images, fonts, icons here.

```
assets/
├── images/
│   ├── logo.png
│   ├── banner.jpg
│   └── placeholder.png
├── icons/
│   ├── home.svg
│   └── profile.svg
└── fonts/
    └── Roboto-Regular.ttf
```

**Important:** You must declare assets in `pubspec.yaml`!

### ✅ **test/** - Tests
Like Jest tests in React.

```
test/
├── widget_test.dart        # Widget tests (like component tests)
├── unit_test.dart          # Unit tests
└── integration_test.dart   # Integration tests
```

---

## 💻 Where to Code What

### 1️⃣ Entry Point: `main.dart`
**MERN Equivalent:** `src/index.js` or `src/App.js`

```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'config/routes.dart';
import 'config/theme.dart';
import 'providers/auth_provider.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // Add more providers here
      ],
      child: MaterialApp(
        title: 'My App',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: HomeScreen(),
        routes: AppRoutes.routes,
      ),
    );
  }
}
```

---

## 🧩 Creating Components (Widgets)

### In React (Component)
```jsx
// src/components/CustomButton.jsx
import React from 'react';
import './CustomButton.css';

const CustomButton = ({ text, onClick, disabled }) => {
  return (
    <button 
      className="custom-btn" 
      onClick={onClick}
      disabled={disabled}
    >
      {text}
    </button>
  );
};

export default CustomButton;
```

### In Flutter (Widget)
```dart
// lib/widgets/common/custom_button.dart
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(color: Colors.white),
            )
          : Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
    );
  }
}
```

### Using the Widget
```dart
// In any screen
CustomButton(
  text: 'Submit',
  onPressed: () {
    print('Button clicked!');
  },
  isLoading: false,
)
```

---

## 📱 Creating Pages (Screens)

### In React (Page)
```jsx
// src/pages/HomePage.jsx
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import CustomButton from '../components/CustomButton';

const HomePage = () => {
  const [data, setData] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    fetchData();
  }, []);

  const fetchData = async () => {
    setLoading(true);
    try {
      const response = await axios.get('/api/users');
      setData(response.data);
    } catch (error) {
      console.error(error);
    }
    setLoading(false);
  };

  return (
    <div className="home-page">
      <h1>Home Page</h1>
      {loading ? (
        <p>Loading...</p>
      ) : (
        <ul>
          {data.map(item => (
            <li key={item.id}>{item.name}</li>
          ))}
        </ul>
      )}
      <CustomButton text="Refresh" onClick={fetchData} />
    </div>
  );
};

export default HomePage;
```

### In Flutter (Screen)
```dart
// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import '../../widgets/common/custom_button.dart';
import '../../services/api/user_api.dart';
import '../../models/user.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> data = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    
    try {
      final users = await UserApi.getUsers();
      setState(() => data = users);
    } catch (error) {
      print('Error: $error');
    }
    
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data[index].name),
                        subtitle: Text(data[index].email),
                      );
                    },
                  ),
                ),
                CustomButton(
                  text: 'Refresh',
                  onPressed: fetchData,
                ),
              ],
            ),
    );
  }
}
```

---

## 🌐 API Calling & Services

### In React (Axios Service)
```javascript
// src/services/userService.js
import axios from 'axios';

const API_URL = 'https://api.example.com';

export const getUsers = async () => {
  const response = await axios.get(`${API_URL}/users`);
  return response.data;
};

export const createUser = async (userData) => {
  const response = await axios.post(`${API_URL}/users`, userData);
  return response.data;
};

export const loginUser = async (email, password) => {
  const response = await axios.post(`${API_URL}/auth/login`, {
    email,
    password
  });
  return response.data;
};
```

### In Flutter (HTTP Service)

**Step 1: Install http package**
```yaml
# pubspec.yaml
dependencies:
  http: ^1.1.0
```

**Step 2: Create API Constants**
```dart
// lib/constants/api_constants.dart
class ApiConstants {
  static const String baseUrl = 'https://api.example.com';
  static const String users = '/users';
  static const String login = '/auth/login';
  static const String register = '/auth/register';
}
```

**Step 3: Create Base API Client**
```dart
// lib/services/api/api_client.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../constants/api_constants.dart';

class ApiClient {
  static final Map<String, String> _headers = {
    'Content-Type': 'application/json',
  };

  static void setToken(String token) {
    _headers['Authorization'] = 'Bearer $token';
  }

  static Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
    
    try {
      final response = await http.get(url, headers: _headers);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
    
    try {
      final response = await http.post(
        url,
        headers: _headers,
        body: json.encode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<dynamic> put(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
    
    try {
      final response = await http.put(
        url,
        headers: _headers,
        body: json.encode(data),
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<dynamic> delete(String endpoint) async {
    final url = Uri.parse('${ApiConstants.baseUrl}$endpoint');
    
    try {
      final response = await http.delete(url, headers: _headers);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Server error: ${response.statusCode}');
    }
  }
}
```

**Step 4: Create Specific API Services**
```dart
// lib/services/api/user_api.dart
import '../api/api_client.dart';
import '../../models/user.dart';
import '../../constants/api_constants.dart';

class UserApi {
  // GET all users
  static Future<List<User>> getUsers() async {
    final response = await ApiClient.get(ApiConstants.users);
    return (response['users'] as List)
        .map((json) => User.fromJson(json))
        .toList();
  }

  // GET single user
  static Future<User> getUser(String id) async {
    final response = await ApiClient.get('${ApiConstants.users}/$id');
    return User.fromJson(response['user']);
  }

  // POST create user
  static Future<User> createUser(User user) async {
    final response = await ApiClient.post(
      ApiConstants.users,
      user.toJson(),
    );
    return User.fromJson(response['user']);
  }

  // PUT update user
  static Future<User> updateUser(String id, User user) async {
    final response = await ApiClient.put(
      '${ApiConstants.users}/$id',
      user.toJson(),
    );
    return User.fromJson(response['user']);
  }

  // DELETE user
  static Future<void> deleteUser(String id) async {
    await ApiClient.delete('${ApiConstants.users}/$id');
  }
}
```

**Step 5: Create Auth API**
```dart
// lib/services/api/auth_api.dart
import '../api/api_client.dart';
import '../../models/user.dart';
import '../../constants/api_constants.dart';

class AuthApi {
  // Login
  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await ApiClient.post(
      ApiConstants.login,
      {
        'email': email,
        'password': password,
      },
    );
    return response;
  }

  // Register
  static Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    final response = await ApiClient.post(
      ApiConstants.register,
      {
        'name': name,
        'email': email,
        'password': password,
      },
    );
    return response;
  }

  // Logout
  static Future<void> logout() async {
    await ApiClient.post('/auth/logout', {});
  }
}
```

---

## 🔄 State Management

### In React (Context API)
```jsx
// src/context/AuthContext.jsx
import React, { createContext, useState, useContext } from 'react';

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(false);

  const login = async (email, password) => {
    setLoading(true);
    // API call
    setLoading(false);
  };

  const logout = () => {
    setUser(null);
  };

  return (
    <AuthContext.Provider value={{ user, loading, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
```

### In Flutter (Provider)

**Step 1: Install Provider**
```yaml
# pubspec.yaml
dependencies:
  provider: ^6.1.1
```

**Step 2: Create Provider**
```dart
// lib/providers/auth_provider.dart
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api/auth_api.dart';
import '../services/api/api_client.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  String? _error;

  // Getters
  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;

  // Login
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await AuthApi.login(email, password);
      _user = User.fromJson(response['user']);
      
      // Save token
      ApiClient.setToken(response['token']);
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Register
  Future<bool> register(String name, String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await AuthApi.register(name, email, password);
      _user = User.fromJson(response['user']);
      ApiClient.setToken(response['token']);
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    await AuthApi.logout();
    _user = null;
    notifyListeners();
  }
}
```

**Step 3: Wrap App with Provider**
```dart
// lib/main.dart
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // Add more providers here
      ],
      child: MyApp(),
    ),
  );
}
```

**Step 4: Use Provider in Screens**
```dart
// lib/screens/login/login_screen.dart
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Listen to provider changes
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            authProvider.isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () async {
                      final success = await authProvider.login(
                        _emailController.text,
                        _passwordController.text,
                      );
                      
                      if (success) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(authProvider.error ?? 'Login failed')),
                        );
                      }
                    },
                    child: Text('Login'),
                  ),
          ],
        ),
      ),
    );
  }
}
```

**Using Provider without rebuilding widget**
```dart
// Read without listening (won't rebuild)
Provider.of<AuthProvider>(context, listen: false).login();

// Or use Consumer for partial rebuilds
Consumer<AuthProvider>(
  builder: (context, authProvider, child) {
    return Text(authProvider.user?.name ?? 'Guest');
  },
)
```

---

## 📊 Data Models

### In React (TypeScript Interface)
```typescript
// src/models/User.ts
interface User {
  id: string;
  name: string;
  email: string;
  createdAt: Date;
}
```

### In Flutter (Dart Class)
```dart
// lib/models/user.dart
class User {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
  });

  // Convert JSON to User (like JSON.parse)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? json['id'],
      name: json['name'],
      email: json['email'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  // Convert User to JSON (like JSON.stringify)
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Copy with (like spread operator)
  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      id: this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      createdAt: this.createdAt,
    );
  }
}
```

**More Complex Model Example**
```dart
// lib/models/product.dart
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final Category category;
  final bool inStock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    required this.inStock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      images: List<String>.from(json['images']),
      category: Category.fromJson(json['category']),
      inStock: json['inStock'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'description': description,
      'price': price,
      'images': images,
      'category': category.toJson(),
      'inStock': inStock,
    };
  }
}

class Category {
  final String id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
  }
}
```

---

## 🧭 Routing & Navigation

### In React (React Router)
```jsx
// src/App.js
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import HomePage from './pages/HomePage';
import LoginPage from './pages/LoginPage';
import ProfilePage from './pages/ProfilePage';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/login" element={<LoginPage />} />
        <Route path="/profile" element={<ProfilePage />} />
      </Routes>
    </BrowserRouter>
  );
}

// Navigate programmatically
import { useNavigate } from 'react-router-dom';

const navigate = useNavigate();
navigate('/profile');
```

### In Flutter (Named Routes)

**Step 1: Define Routes**
```dart
// lib/config/routes.dart
import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/profile/profile_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String login = '/login';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => HomeScreen(),
    login: (context) => LoginScreen(),
    profile: (context) => ProfileScreen(),
  };
}
```

**Step 2: Register Routes in main.dart**
```dart
// lib/main.dart
import 'config/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}
```

**Step 3: Navigate Between Screens**
```dart
// Push to new screen
Navigator.pushNamed(context, AppRoutes.profile);

// Replace current screen
Navigator.pushReplacementNamed(context, AppRoutes.home);

// Go back
Navigator.pop(context);

// Pass data to next screen
Navigator.pushNamed(
  context,
  AppRoutes.profile,
  arguments: {'userId': '123'},
);

// Receive data in screen
final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
String userId = args['userId'];
```

---

## 📦 Complete Example Project

Let's build a simple Todo app connecting to your Node.js backend!

### Project Structure
```
my_todo_app/
└── lib/
    ├── main.dart
    ├── models/
    │   └── todo.dart
    ├── services/
    │   └── api/
    │       ├── api_client.dart
    │       └── todo_api.dart
    ├── providers/
    │   └── todo_provider.dart
    ├── screens/
    │   ├── home_screen.dart
    │   └── add_todo_screen.dart
    ├── widgets/
    │   └── todo_item.dart
    └── constants/
        └── api_constants.dart
```

### 1. Model
```dart
// lib/models/todo.dart
class Todo {
  final String id;
  final String title;
  final String description;
  final bool completed;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.createdAt,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'],
      title: json['title'],
      description: json['description'] ?? '',
      completed: json['completed'] ?? false,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'completed': completed,
    };
  }
}
```

### 2. API Service
```dart
// lib/services/api/todo_api.dart
import '../api_client.dart';
import '../../models/todo.dart';

class TodoApi {
  static Future<List<Todo>> getTodos() async {
    final response = await ApiClient.get('/todos');
    return (response['todos'] as List)
        .map((json) => Todo.fromJson(json))
        .toList();
  }

  static Future<Todo> createTodo(Todo todo) async {
    final response = await ApiClient.post('/todos', todo.toJson());
    return Todo.fromJson(response['todo']);
  }

  static Future<Todo> updateTodo(String id, Todo todo) async {
    final response = await ApiClient.put('/todos/$id', todo.toJson());
    return Todo.fromJson(response['todo']);
  }

  static Future<void> deleteTodo(String id) async {
    await ApiClient.delete('/todos/$id');
  }
}
```

### 3. Provider
```dart
// lib/providers/todo_provider.dart
import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/api/todo_api.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  bool _isLoading = false;
  String? _error;

  List<Todo> get todos => _todos;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchTodos() async {
    _isLoading = true;
    notifyListeners();

    try {
      _todos = await TodoApi.getTodos();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addTodo(Todo todo) async {
    try {
      final newTodo = await TodoApi.createTodo(todo);
      _todos.add(newTodo);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> toggleTodo(String id) async {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      final todo = _todos[index];
      final updated = Todo(
        id: todo.id,
        title: todo.title,
        description: todo.description,
        completed: !todo.completed,
        createdAt: todo.createdAt,
      );

      try {
        await TodoApi.updateTodo(id, updated);
        _todos[index] = updated;
        notifyListeners();
      } catch (e) {
        _error = e.toString();
        notifyListeners();
      }
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      await TodoApi.deleteTodo(id);
      _todos.removeWhere((todo) => todo.id == id);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
```

### 4. Widget (Todo Item Component)
```dart
// lib/widgets/todo_item.dart
import 'package:flutter/material.dart';
import '../models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Checkbox(
          value: todo.completed,
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(todo.description),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
```

### 5. Home Screen
```dart
// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_item.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TodoProvider>(context, listen: false).fetchTodos());
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('My Todos'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => todoProvider.fetchTodos(),
          ),
        ],
      ),
      body: todoProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : todoProvider.error != null
              ? Center(child: Text('Error: ${todoProvider.error}'))
              : todoProvider.todos.isEmpty
                  ? Center(child: Text('No todos yet!'))
                  : ListView.builder(
                      itemCount: todoProvider.todos.length,
                      itemBuilder: (context, index) {
                        final todo = todoProvider.todos[index];
                        return TodoItem(
                          todo: todo,
                          onToggle: () => todoProvider.toggleTodo(todo.id),
                          onDelete: () => todoProvider.deleteTodo(todo.id),
                        );
                      },
                    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```

### 6. Add Todo Screen
```dart
// lib/screens/add_todo_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Todo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final todo = Todo(
                  id: '',
                  title: _titleController.text,
                  description: _descriptionController.text,
                  completed: false,
                  createdAt: DateTime.now(),
                );

                await Provider.of<TodoProvider>(context, listen: false)
                    .addTodo(todo);

                Navigator.pop(context);
              },
              child: Text('Add Todo'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### 7. Main.dart
```dart
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/todo_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}
```

---

## 🎯 Common Patterns

### Local Storage (like localStorage)

**Install Package:**
```yaml
# pubspec.yaml
dependencies:
  shared_preferences: ^2.2.2
```

**Usage:**
```dart
// lib/services/storage_service.dart
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<void> saveToken(String token) async {
    await saveString('auth_token', token);
  }

  static Future<String?> getToken() async {
    return await getString('auth_token');
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
```

### Environment Variables

**Install Package:**
```yaml
# pubspec.yaml
dependencies:
  flutter_dotenv: ^5.1.0

flutter:
  assets:
    - .env
```

**Create .env file:**
```
API_URL=https://api.example.com
API_KEY=your_api_key_here
```

**Usage:**
```dart
// lib/main.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(MyApp());
}

// Access variables
String apiUrl = dotenv.env['API_URL']!;
```

### Form Validation
```dart
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                if (!value.contains('@')) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form is valid, proceed with login
                  print('Form is valid');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 🚀 Quick Start Checklist

1. ✅ Create folders: `screens/`, `widgets/`, `models/`, `services/`, `providers/`, `utils/`, `constants/`
2. ✅ Install packages: `http`, `provider`, `shared_preferences`
3. ✅ Create `api_client.dart` for HTTP requests
4. ✅ Create models with `fromJson()` and `toJson()`
5. ✅ Create providers for state management
6. ✅ Create screens (pages)
7. ✅ Create reusable widgets (components)
8. ✅ Set up routing in `main.dart`

---

## 📚 Key Differences Summary

| Concept | React/MERN | Flutter |
|---------|------------|---------|
| Component | Function Component | StatelessWidget |
| State Component | useState Hook | StatefulWidget + setState |
| Props | props | Constructor parameters |
| State Management | Redux/Context | Provider/Bloc |
| API Calls | axios/fetch | http package |
| Local Storage | localStorage | shared_preferences |
| Routing | react-router | Navigator |
| Styling | CSS/styled-components | Widget properties |
| Package Manager | npm/yarn | pub |
| Dependencies File | package.json | pubspec.yaml |

---

**You're now ready to build Flutter apps with your MERN experience! 🎉**

Happy coding! 🚀
