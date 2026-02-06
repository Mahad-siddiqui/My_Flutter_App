// User model - Represents a user in the app
class User {
  final String username;
  final String password;

  User({
    required this.username,
    required this.password,
  });

  // Convert User object to JSON (for saving to storage)
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  // Create User object from JSON (for loading from storage)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      password: json['password'],
    );
  }
}
