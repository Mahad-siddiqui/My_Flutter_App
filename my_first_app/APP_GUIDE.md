# Todo App with Authentication - Complete Guide

## 📁 Project Structure

```
lib/
├── models/                  # Data models (User, Todo)
│   ├── user.dart
│   └── todo.dart
│
├── services/               # Business logic (like API services in MERN)
│   ├── storage_service.dart
│   ├── auth_service.dart
│   └── todo_service.dart
│
├── screens/               # Pages (like React pages)
│   ├── login_screen.dart
│   └── home_screen.dart
│
├── widgets/               # Reusable components (like React components)
│   └── todo_item.dart
│
└── main.dart             # Entry point
```

---

## 🎯 How the App Works

### 1. App Flow
```
main.dart (Entry Point)
    ↓
SplashScreen (Check if user is logged in)
    ↓
If logged in → HomeScreen (Todo list)
If not logged in → LoginScreen
```

### 2. Authentication Flow
```
LoginScreen
    ↓
User enters username & password
    ↓
Signup: AuthService.signup() → Save user to storage
Login: AuthService.login() → Check credentials → Save session
    ↓
Navigate to HomeScreen
```

### 3. Todo Flow
```
HomeScreen
    ↓
Load todos from storage
    ↓
Display in list
    ↓
Add/Toggle/Delete → TodoService → Update storage → Reload
```

---

## 📝 File-by-File Explanation

### 1. Models (Data Structure)

#### `models/user.dart`
```dart
class User {
  final String username;
  final String password;
  
  // Convert to JSON for storage
  Map<String, dynamic> toJson() { ... }
  
  // Create from JSON when loading
  factory User.fromJson(Map<String, dynamic> json) { ... }
}
```

**Like in MERN:**
```javascript
// MongoDB Schema
const userSchema = new Schema({
  username: String,
  password: String
});
```

#### `models/todo.dart`
```dart
class Todo {
  final String id;
  final String title;
  final bool isCompleted;
  
  // Convert to/from JSON
  Map<String, dynamic> toJson() { ... }
  factory Todo.fromJson(Map<String, dynamic> json) { ... }
  
  // Copy with changes (because Flutter is immutable)
  Todo copyWith({...}) { ... }
}
```

**Like in MERN:**
```javascript
const todoSchema = new Schema({
  id: String,
  title: String,
  isCompleted: Boolean
});
```

---

### 2. Services (Business Logic)

#### `services/storage_service.dart`
**Purpose:** Save and load data from device storage (like localStorage)

```dart
class StorageService {
  // Save string
  static Future<void> saveString(String key, String value) { ... }
  
  // Get string
  static Future<String?> getString(String key) { ... }
  
  // Save JSON object
  static Future<void> saveJson(String key, Map<String, dynamic> json) { ... }
  
  // Get JSON object
  static Future<Map<String, dynamic>?> getJson(String key) { ... }
}
```

**Like in MERN:**
```javascript
// localStorage in browser
localStorage.setItem('key', 'value');
localStorage.getItem('key');
```

#### `services/auth_service.dart`
**Purpose:** Handle user authentication

```dart
class AuthService {
  // Sign up new user
  static Future<bool> signup(String username, String password) {
    // 1. Check if user exists
    // 2. Create new user
    // 3. Save to storage
  }
  
  // Login existing user
  static Future<User?> login(String username, String password) {
    // 1. Find user
    // 2. Check password
    // 3. Save session
  }
  
  // Get current logged-in user
  static Future<User?> getCurrentUser() { ... }
  
  // Logout
  static Future<void> logout() { ... }
}
```

**Like in MERN:**
```javascript
// Express.js backend
router.post('/signup', async (req, res) => {
  const { username, password } = req.body;
  // Check if exists
  // Create user
  // Save to MongoDB
});

router.post('/login', async (req, res) => {
  const { username, password } = req.body;
  // Find user
  // Check password
  // Return token/session
});
```

#### `services/todo_service.dart`
**Purpose:** CRUD operations for todos

```dart
class TodoService {
  // Get all todos
  static Future<List<Todo>> getTodos() { ... }
  
  // Add new todo
  static Future<void> addTodo(String title) { ... }
  
  // Toggle completed
  static Future<void> toggleTodo(String id) { ... }
  
  // Delete todo
  static Future<void> deleteTodo(String id) { ... }
  
  // Delete all completed
  static Future<void> deleteCompleted() { ... }
}
```

**Like in MERN:**
```javascript
// Express.js routes
router.get('/todos', async (req, res) => {
  const todos = await Todo.find();
  res.json(todos);
});

router.post('/todos', async (req, res) => {
  const todo = new Todo(req.body);
  await todo.save();
  res.json(todo);
});

router.delete('/todos/:id', async (req, res) => {
  await Todo.findByIdAndDelete(req.params.id);
  res.json({ success: true });
});
```

---

### 3. Screens (Pages)

#### `screens/login_screen.dart`
**Purpose:** Login and signup page

**Key parts:**
```dart
class LoginScreen extends StatefulWidget {
  // This is a StatefulWidget because it has state (user input)
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers to get text input
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  bool _isLogin = true; // Toggle between login/signup
  String _message = ''; // Show errors/success
  
  // Handle login
  Future<void> _handleLogin() async {
    // 1. Get username & password
    // 2. Validate
    // 3. Call AuthService.login()
    // 4. If success, navigate to HomeScreen
    // 5. If error, show message
  }
  
  // Handle signup
  Future<void> _handleSignup() async {
    // Similar to login
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(...),
      body: Column(
        children: [
          TextField(...), // Username
          TextField(...), // Password
          ElevatedButton(...), // Login/Signup button
          TextButton(...), // Toggle login/signup
        ],
      ),
    );
  }
}
```

**Like in React:**
```jsx
function LoginScreen() {
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');
  const [isLogin, setIsLogin] = useState(true);
  const [message, setMessage] = useState('');
  
  const handleLogin = async () => {
    // Validate
    // Call API
    // Navigate or show error
  };
  
  return (
    <div>
      <input value={username} onChange={e => setUsername(e.target.value)} />
      <input type="password" value={password} onChange={e => setPassword(e.target.value)} />
      <button onClick={handleLogin}>Login</button>
    </div>
  );
}
```

#### `screens/home_screen.dart`
**Purpose:** Main todo list page

**Key parts:**
```dart
class HomeScreen extends StatefulWidget { ... }

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> _todos = [];
  final _todoController = TextEditingController();
  String _username = '';
  
  @override
  void initState() {
    super.initState();
    _loadData(); // Load todos when screen opens
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
  
  // Add todo
  Future<void> _addTodo() async {
    await TodoService.addTodo(_todoController.text);
    _loadData(); // Reload list
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $_username!'),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: _logout),
        ],
      ),
      body: Column(
        children: [
          // Stats cards
          Row(...),
          
          // Add todo input
          TextField(...),
          
          // Todo list
          ListView.builder(
            itemCount: _todos.length,
            itemBuilder: (context, index) {
              return TodoItem(todo: _todos[index], ...);
            },
          ),
        ],
      ),
    );
  }
}
```

**Like in React:**
```jsx
function HomeScreen() {
  const [todos, setTodos] = useState([]);
  const [username, setUsername] = useState('');
  const [todoInput, setTodoInput] = useState('');
  
  useEffect(() => {
    loadData();
  }, []);
  
  const loadData = async () => {
    const user = await AuthService.getCurrentUser();
    const todos = await TodoService.getTodos();
    setUsername(user.username);
    setTodos(todos);
  };
  
  const addTodo = async () => {
    await TodoService.addTodo(todoInput);
    loadData();
  };
  
  return (
    <div>
      <h1>Welcome, {username}!</h1>
      <input value={todoInput} onChange={e => setTodoInput(e.target.value)} />
      <button onClick={addTodo}>Add</button>
      <ul>
        {todos.map(todo => (
          <TodoItem key={todo.id} todo={todo} />
        ))}
      </ul>
    </div>
  );
}
```

---

### 4. Widgets (Components)

#### `widgets/todo_item.dart`
**Purpose:** Reusable todo item component

```dart
class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;
  
  const TodoItem({
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (_) => onToggle(),
        ),
        title: Text(todo.title),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
```

**Like in React:**
```jsx
function TodoItem({ todo, onToggle, onDelete }) {
  return (
    <div className="todo-item">
      <input 
        type="checkbox" 
        checked={todo.isCompleted} 
        onChange={onToggle} 
      />
      <span>{todo.title}</span>
      <button onClick={onDelete}>Delete</button>
    </div>
  );
}
```

---

### 5. Main Entry Point

#### `main.dart`
```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(...),
      home: const SplashScreen(),
    );
  }
}

// SplashScreen checks if user is logged in
class SplashScreen extends StatefulWidget { ... }
```

**Like in React:**
```jsx
// index.js
ReactDOM.render(
  <BrowserRouter>
    <App />
  </BrowserRouter>,
  document.getElementById('root')
);

// App.js
function App() {
  const [isLoading, setIsLoading] = useState(true);
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  
  useEffect(() => {
    checkAuth();
  }, []);
  
  const checkAuth = async () => {
    const loggedIn = await AuthService.isLoggedIn();
    setIsLoggedIn(loggedIn);
    setIsLoading(false);
  };
  
  if (isLoading) return <div>Loading...</div>;
  
  return isLoggedIn ? <HomeScreen /> : <LoginScreen />;
}
```

---

## 🔑 Key Concepts Explained

### 1. StatelessWidget vs StatefulWidget

**StatelessWidget:** Never changes
```dart
class MyWidget extends StatelessWidget {
  // No state, no changes
  @override
  Widget build(BuildContext context) {
    return Text('Hello');
  }
}
```

**StatefulWidget:** Can change (has state)
```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int counter = 0; // STATE
  
  void increment() {
    setState(() {
      counter++; // Change state and rebuild
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Text('$counter');
  }
}
```

**Like in React:**
```jsx
// Stateless (Function component)
function MyWidget() {
  return <div>Hello</div>;
}

// Stateful (useState)
function MyWidget() {
  const [counter, setCounter] = useState(0);
  
  const increment = () => {
    setCounter(counter + 1);
  };
  
  return <div>{counter}</div>;
}
```

### 2. `setState()` vs `notifyListeners()`

**setState():** Updates state in a single widget
```dart
setState(() {
  _todos = newTodos;
});
```

**Like React:**
```javascript
setState({ todos: newTodos });
// or
setTodos(newTodos);
```

### 3. `async/await`

Flutter uses async/await just like JavaScript:

```dart
// Flutter
Future<void> loadData() async {
  final data = await TodoService.getTodos();
  setState(() {
    _todos = data;
  });
}
```

```javascript
// JavaScript
async function loadData() {
  const data = await TodoService.getTodos();
  setTodos(data);
}
```

### 4. Navigation

**Flutter:**
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()),
);
```

**React:**
```javascript
navigate('/home');
// or
<Link to="/home">Home</Link>
```

---

## 🚀 How to Test the App

### 1. Run the app
```bash
cd my_first_app
flutter run
```

### 2. Test Flow

**Signup:**
1. Click "Sign Up"
2. Enter username: `testuser`
3. Enter password: `1234`
4. Click "Sign Up"
5. See success message
6. Click "Login"

**Login:**
1. Enter username: `testuser`
2. Enter password: `1234`
3. Click "Login"
4. Should navigate to Home screen

**Add Todos:**
1. Type "Buy groceries" in input
2. Click "+" button
3. Todo appears in list
4. Add more todos

**Complete Todos:**
1. Click checkbox next to a todo
2. Todo gets crossed out
3. Stats update

**Delete Todos:**
1. Click red delete icon
2. Todo removed from list

**Delete Completed:**
1. Complete some todos
2. Click "Delete Completed" button
3. All completed todos removed

**Logout:**
1. Click logout icon (top right)
2. Returns to login screen
3. Login again - todos are saved!

---

## 💡 Key Differences from MERN

| Feature | MERN (React) | Flutter |
|---------|--------------|---------|
| State | useState() | setState() |
| Components | Function components | StatelessWidget/StatefulWidget |
| Props | props | Constructor parameters |
| Effect | useEffect() | initState(), didUpdateWidget() |
| Storage | localStorage | shared_preferences |
| Backend | Node.js + Express + MongoDB | Services + Local storage |
| Routing | React Router | Navigator |
| Styling | CSS | Widget properties |

---

## 📚 What You Learned

✅ Folder structure (models, services, screens, widgets)
✅ StatelessWidget vs StatefulWidget
✅ Local storage with shared_preferences
✅ Authentication flow (signup/login/logout)
✅ CRUD operations (Create, Read, Update, Delete)
✅ Navigation between screens
✅ Reusable widgets (components)
✅ async/await in Dart
✅ setState() for updating UI
✅ Data models and JSON conversion

---

## 🎯 Next Steps

1. ✅ **You now have a working authentication + todo app!**
2. Add more features:
   - Edit todo
   - Todo categories
   - Due dates
   - Search/filter
3. Add provider for state management
4. Connect to real backend API
5. Add animations

**Congratulations! You've built your first Flutter app!** 🎉
