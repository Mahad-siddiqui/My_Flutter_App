import 'dart:convert';
import '../models/user.dart';
import 'storage_service.dart';

// AuthService - Handles user authentication (login/signup)
class AuthService {
  static const String _userKey = 'current_user';
  static const String _usersKey = 'all_users';

  // Sign up a new user
  static Future<bool> signup(String username, String password) async {
    // Check if user already exists
    final existingUser = await getUserByUsername(username);
    if (existingUser != null) {
      return false; // User already exists
    }

    // Create new user
    final newUser = User(username: username, password: password);
    
    // Get all existing users
    final users = await getAllUsers();
    users.add(newUser);
    
    // Save all users
    await saveAllUsers(users);
    
    return true; // Success
  }

  // Login user
  static Future<User?> login(String username, String password) async {
    final user = await getUserByUsername(username);
    
    if (user == null) {
      return null; // User not found
    }
    
    if (user.password != password) {
      return null; // Wrong password
    }
    
    // Save current logged-in user
    await StorageService.saveJson(_userKey, user.toJson());
    
    return user; // Success
  }

  // Get currently logged-in user
  static Future<User?> getCurrentUser() async {
    final json = await StorageService.getJson(_userKey);
    if (json == null) return null;
    return User.fromJson(json);
  }

  // Logout user
  static Future<void> logout() async {
    await StorageService.remove(_userKey);
  }

  // Check if user is logged in
  static Future<bool> isLoggedIn() async {
    final user = await getCurrentUser();
    return user != null;
  }

  // Helper: Get user by username
  static Future<User?> getUserByUsername(String username) async {
    final users = await getAllUsers();
    try {
      return users.firstWhere((user) => user.username == username);
    } catch (e) {
      return null;
    }
  }

  // Helper: Get all users
  static Future<List<User>> getAllUsers() async {
    final jsonList = await StorageService.getStringList(_usersKey);
    return jsonList.map((jsonString) {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return User.fromJson(json);
    }).toList();
  }

  // Helper: Save all users
  static Future<void> saveAllUsers(List<User> users) async {
    final jsonList = users.map((user) => jsonEncode(user.toJson())).toList();
    await StorageService.saveStringList(_usersKey, jsonList);
  }
}
