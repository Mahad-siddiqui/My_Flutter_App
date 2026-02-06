import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../services/auth_service.dart';
import '../services/todo_service.dart';
import '../widgets/todo_item.dart';
import 'login_screen.dart';

// HomeScreen - Main todo list screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> _todos = [];
  final _todoController = TextEditingController();
  String _username = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Load user and todos
  Future<void> _loadData() async {
    final user = await AuthService.getCurrentUser();
    final todos = await TodoService.getTodos();
    
    setState(() {
      _username = user?.username ?? 'User';
      _todos = todos;
    });
  }

  // Add new todo
  Future<void> _addTodo() async {
    final title = _todoController.text.trim();
    
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a todo')),
      );
      return;
    }

    await TodoService.addTodo(title);
    _todoController.clear();
    await _loadData(); // Reload todos
  }

  // Toggle todo completion
  Future<void> _toggleTodo(String id) async {
    await TodoService.toggleTodo(id);
    await _loadData();
  }

  // Delete a todo
  Future<void> _deleteTodo(String id) async {
    await TodoService.deleteTodo(id);
    await _loadData();
  }

  // Delete all completed todos
  Future<void> _deleteCompleted() async {
    await TodoService.deleteCompleted();
    await _loadData();
  }

  // Logout user
  Future<void> _logout() async {
    await AuthService.logout();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final completedCount = _todos.where((todo) => todo.isCompleted).length;
    final pendingCount = _todos.length - completedCount;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $_username!'),
        centerTitle: true,
        actions: [
          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
          // Stats
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard('Total', _todos.length, Colors.blue),
                _buildStatCard('Pending', pendingCount, Colors.orange),
                _buildStatCard('Completed', completedCount, Colors.green),
              ],
            ),
          ),

          // Add todo section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                      hintText: 'Enter a new todo',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _addTodo(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTodo,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Delete completed button
          if (completedCount > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _deleteCompleted,
                  icon: const Icon(Icons.delete_sweep),
                  label: const Text('Delete Completed'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ),

          const SizedBox(height: 16),

          // Todo list
          Expanded(
            child: _todos.isEmpty
                ? const Center(
                    child: Text(
                      'No todos yet!\nAdd one above to get started.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _todos.length,
                    itemBuilder: (context, index) {
                      final todo = _todos[index];
                      return TodoItem(
                        todo: todo,
                        onToggle: () => _toggleTodo(todo.id),
                        onDelete: () => _deleteTodo(todo.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // Helper: Build stat card
  Widget _buildStatCard(String label, int count, Color color) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }
}
