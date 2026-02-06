import 'dart:convert';
import '../models/todo.dart';
import 'storage_service.dart';

// TodoService - Handles all todo operations (CRUD)
// Create, Read, Update, Delete
class TodoService {
  static const String _todosKey = 'todos';

  // Get all todos
  static Future<List<Todo>> getTodos() async {
    final jsonList = await StorageService.getStringList(_todosKey);
    return jsonList.map((jsonString) {
      final json = jsonDecode(jsonString);
      return Todo.fromJson(json);
    }).toList();
  }

  // Add a new todo
  static Future<void> addTodo(String title) async {
    final todos = await getTodos();
    
    // Create new todo with unique ID
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      isCompleted: false,
    );
    
    todos.add(newTodo);
    await _saveTodos(todos);
  }

  // Toggle todo completed status
  static Future<void> toggleTodo(String id) async {
    final todos = await getTodos();
    
    final index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      todos[index] = todos[index].copyWith(
        isCompleted: !todos[index].isCompleted,
      );
      await _saveTodos(todos);
    }
  }

  // Delete a todo
  static Future<void> deleteTodo(String id) async {
    final todos = await getTodos();
    todos.removeWhere((todo) => todo.id == id);
    await _saveTodos(todos);
  }

  // Delete all completed todos
  static Future<void> deleteCompleted() async {
    final todos = await getTodos();
    todos.removeWhere((todo) => todo.isCompleted);
    await _saveTodos(todos);
  }

  // Helper: Save all todos to storage
  static Future<void> _saveTodos(List<Todo> todos) async {
    final jsonList = todos.map((todo) {
      return jsonEncode(todo.toJson());
    }).toList();
    await StorageService.saveStringList(_todosKey, jsonList);
  }
}
