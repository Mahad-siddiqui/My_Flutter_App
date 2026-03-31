# 🚀 Complete Flutter App Guide

Welcome! This guide is specially designed for **MERN (MongoDB, Express, React, Node.js)** developers who want to transition into **Flutter** mobile app development.

---

## 📋 Table of Contents

1. [What is Flutter?](#what-is-flutter)
2. [Flutter vs Library vs Framework](#flutter-vs-library-vs-framework)
3. [Dart Programming Language](#dart-programming-language)
4. [Prerequisites](#prerequisites)
5. [Installation & Setup](#installation--setup)
6. [Flutter Architecture](#flutter-architecture)
7. [Project Structure](#project-structure)
8. [Widgets - The Building Blocks](#widgets---the-building-blocks)
9. [State Management](#state-management)
10. [Navigation & Routing](#navigation--routing)
11. [MERN vs Flutter Comparison](#mern-vs-flutter-comparison)
12. [Common Flutter Packages](#common-flutter-packages)
13. [Best Practices](#best-practices)
14. [Learning Roadmap](#learning-roadmap)
15. [Resources](#resources)

---

## 🎯 What is Flutter?

**Flutter** is an **open-source UI software development kit (SDK)** created by **Google** in **2017**.

### Key Points:
- **NOT a library** - It's a complete **Framework/SDK**
- Used to build **cross-platform applications** from a single codebase
- Can build apps for:
  - 📱 iOS
  - 📱 Android
  - 🌐 Web
  - 💻 Desktop (Windows, macOS, Linux)
  - 🖥️ Embedded devices

### Why Flutter?

| Feature | Description |
|---------|-------------|
| **Single Codebase** | Write once, run everywhere |
| **Hot Reload** | See changes instantly without restarting app |
| **Beautiful UI** | Rich set of customizable widgets |
| **Native Performance** | Compiles to native ARM code |
| **Large Community** | Active community & rich ecosystem |
| **Google Backed** | Strong support and regular updates |

---

## 🔍 Flutter vs Library vs Framework

### Understanding the Difference:

```
┌─────────────────────────────────────────────────────────────────┐
│                         COMPARISON                               │
├─────────────────────────────────────────────────────────────────┤
│  LIBRARY (e.g., Lodash, Axios)                                  │
│  - You call the library                                         │
│  - You control the flow                                         │
│  - Provides specific functionality                              │
├─────────────────────────────────────────────────────────────────┤
│  FRAMEWORK (e.g., React, Angular, Flutter)                      │
│  - Framework calls your code                                    │
│  - Framework controls the flow (Inversion of Control)           │
│  - Provides complete structure                                  │
├─────────────────────────────────────────────────────────────────┤
│  SDK (Software Development Kit)                                 │
│  - Complete toolkit with frameworks, libraries, tools           │
│  - Flutter is technically an SDK that includes a framework      │
└─────────────────────────────────────────────────────────────────┘
```

### Flutter is a FRAMEWORK because:
1. It provides the **complete structure** for your app
2. It follows **Inversion of Control** - Flutter calls your widget's build method
3. Has its own **rendering engine** (Skia)
4. Includes **CLI tools**, **testing framework**, and **dev tools**

---

## 🎯 Dart Programming Language

Flutter uses **Dart** - a programming language also developed by **Google**.

### Why Dart?

| Feature | Benefit |
|---------|---------|
| **AOT Compilation** | Fast startup & native performance |
| **JIT Compilation** | Hot reload during development |
| **Strong Typing** | Catch errors at compile time |
| **Null Safety** | Prevents null reference errors |
| **Familiar Syntax** | Similar to JavaScript, Java, C# |

### Dart vs JavaScript Comparison (For MERN Devs):

```dart
// ═══════════════════════════════════════════════════════════
// JAVASCRIPT (What you know)
// ═══════════════════════════════════════════════════════════

// Variables
let name = "John";
const age = 25;
var city = "NYC";

// Functions
function greet(name) {
    return `Hello, ${name}!`;
}

const greetArrow = (name) => `Hello, ${name}!`;

// Classes
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
    
    greet() {
        return `Hi, I'm ${this.name}`;
    }
}

// Async/Await
async function fetchData() {
    const response = await fetch(url);
    const data = await response.json();
    return data;
}

// ═══════════════════════════════════════════════════════════
// DART (What you'll learn)
// ═══════════════════════════════════════════════════════════

// Variables
String name = "John";       // Explicit type
final age = 25;             // Runtime constant (like const)
const pi = 3.14;            // Compile-time constant
var city = "NYC";           // Type inference

// Functions
String greet(String name) {
    return "Hello, $name!";
}

String greetArrow(String name) => "Hello, $name!";

// Classes
class Person {
    String name;
    int age;
    
    // Constructor shorthand
    Person(this.name, this.age);
    
    String greet() {
        return "Hi, I'm $name";
    }
}

// Async/Await (Almost identical!)
Future<Map> fetchData() async {
    final response = await http.get(Uri.parse(url));
    final data = jsonDecode(response.body);
    return data;
}
```

### Key Dart Concepts:

```dart
// ═══════════════════════════════════════════════════════════
// 1. NULL SAFETY (Important!)
// ═══════════════════════════════════════════════════════════

String name = "John";        // Cannot be null
String? nullableName;        // Can be null (? makes it nullable)

// Null-aware operators
String displayName = nullableName ?? "Guest";  // If null, use "Guest"
int? length = nullableName?.length;            // Safe call

// ═══════════════════════════════════════════════════════════
// 2. COLLECTIONS
// ═══════════════════════════════════════════════════════════

// List (Array in JS)
List<String> fruits = ["Apple", "Banana", "Orange"];
var numbers = [1, 2, 3, 4, 5];

// Map (Object in JS)
Map<String, dynamic> user = {
    "name": "John",
    "age": 25,
    "isActive": true,
};

// Set (Unique values)
Set<int> uniqueNumbers = {1, 2, 3, 3, 4}; // {1, 2, 3, 4}

// ═══════════════════════════════════════════════════════════
// 3. CLASSES & OOP
// ═══════════════════════════════════════════════════════════

class Animal {
    String name;
    
    Animal(this.name);
    
    void speak() {
        print("$name makes a sound");
    }
}

class Dog extends Animal {
    String breed;
    
    Dog(String name, this.breed) : super(name);
    
    @override
    void speak() {
        print("$name barks!");
    }
}

// ═══════════════════════════════════════════════════════════
// 4. MIXINS (Powerful feature!)
// ═══════════════════════════════════════════════════════════

mixin Swimming {
    void swim() => print("Swimming...");
}

mixin Flying {
    void fly() => print("Flying...");
}

class Duck extends Animal with Swimming, Flying {
    Duck(String name) : super(name);
}

// ═══════════════════════════════════════════════════════════
// 5. ENUMS
// ═══════════════════════════════════════════════════════════

enum Status { pending, approved, rejected }

Status orderStatus = Status.pending;

// Enhanced enums (Dart 2.17+)
enum HttpStatus {
    ok(200, "OK"),
    notFound(404, "Not Found"),
    serverError(500, "Server Error");
    
    final int code;
    final String message;
    
    const HttpStatus(this.code, this.message);
}
```

---

## 📋 Prerequisites

Before starting with Flutter, you should have:

### Required Knowledge:
| Skill | Level | Why? |
|-------|-------|------|
| **OOP Concepts** | Basic | Flutter is heavily OOP-based |
| **Any Programming Language** | Intermediate | Dart is easy to learn |
| **Basic UI/UX Understanding** | Basic | You'll design mobile UIs |

### As a MERN Developer, You Already Have:
- ✅ JavaScript knowledge (Dart is similar)
- ✅ Component-based thinking (React → Widgets)
- ✅ State management concepts
- ✅ Async programming (Promises → Futures)
- ✅ Package management (npm → pub)

### System Requirements:

#### Windows:
- Windows 10 or later (64-bit)
- Disk Space: 2.5 GB minimum
- Git for Windows

#### macOS:
- macOS 10.14 or later
- Xcode (for iOS development)
- Disk Space: 2.8 GB minimum

#### Linux:
- 64-bit Linux
- Disk Space: 600 MB minimum

---

## 🛠️ Installation & Setup

### Step 1: Download Flutter SDK

#### Windows:
```powershell
# Option 1: Download from official website
# Visit: https://docs.flutter.dev/get-started/install/windows

# Option 2: Using Chocolatey (Package Manager)
choco install flutter

# Option 3: Using Git
git clone https://github.com/flutter/flutter.git -b stable
```

#### macOS:
```bash
# Option 1: Using Homebrew (Recommended)
brew install flutter

# Option 2: Using Git
git clone https://github.com/flutter/flutter.git -b stable
```

#### Linux:
```bash
# Using Snap (Recommended)
sudo snap install flutter --classic

# Or using Git
git clone https://github.com/flutter/flutter.git -b stable
```

### Step 2: Add Flutter to PATH

#### Windows:
1. Open **System Properties** → **Environment Variables**
2. Under **User variables**, find **Path**
3. Add Flutter's `bin` directory path:
   ```
   C:\flutter\bin
   ```

#### macOS/Linux:
```bash
# Add to ~/.bashrc or ~/.zshrc
export PATH="$PATH:`pwd`/flutter/bin"

# Reload terminal
source ~/.bashrc  # or source ~/.zshrc
```

### Step 3: Verify Installation

```bash
# Check Flutter installation
flutter doctor
```

Expected output:
```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x)
[✓] Windows Version / macOS / Linux
[✓] Android toolchain
[✓] Chrome - develop for the web
[✓] Visual Studio / Xcode
[✓] Android Studio
[✓] VS Code
[✓] Connected device
[✓] Network resources

• No issues found!
```

### Step 4: Setup Android Development

#### Install Android Studio:
1. Download from: https://developer.android.com/studio
2. Install Android SDK
3. Install Android SDK Command-line Tools
4. Install Android SDK Build-Tools

#### Accept Android Licenses:
```bash
flutter doctor --android-licenses
```

#### Create Android Emulator:
1. Open Android Studio → **Tools** → **Device Manager**
2. Click **Create Device**
3. Select device (e.g., Pixel 6)
4. Download system image
5. Finish setup

### Step 5: Setup iOS Development (macOS only)

```bash
# Install Xcode from App Store

# Install CocoaPods
sudo gem install cocoapods

# Setup Xcode command-line tools
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
```

### Step 6: IDE Setup

#### VS Code (Recommended):
1. Install **Flutter** extension
2. Install **Dart** extension
3. Install **Flutter Widget Snippets** extension

#### Android Studio:
1. Install **Flutter** plugin
2. Install **Dart** plugin

### Step 7: Create Your First Project

```bash
# Create new Flutter project
flutter create my_first_app

# Navigate to project
cd my_first_app

# Run the app
flutter run
```

---

## 🏗️ Flutter Architecture

### How Flutter Works:

```
┌─────────────────────────────────────────────────────────────────┐
│                    YOUR FLUTTER APP                              │
│                  (Dart Code + Widgets)                           │
├─────────────────────────────────────────────────────────────────┤
│                    FLUTTER FRAMEWORK                             │
│  ┌─────────────┬─────────────┬─────────────┬─────────────┐     │
│  │  Material   │   Cupertino │   Widgets   │  Rendering  │     │
│  │  Design     │   (iOS)     │   Library   │   Library   │     │
│  └─────────────┴─────────────┴─────────────┴─────────────┘     │
├─────────────────────────────────────────────────────────────────┤
│                    FLUTTER ENGINE (C++)                          │
│  ┌─────────────┬─────────────┬─────────────┬─────────────┐     │
│  │    Skia     │    Dart     │   Text      │  Platform   │     │
│  │  (Graphics) │   Runtime   │  Rendering  │  Channels   │     │
│  └─────────────┴─────────────┴─────────────┴─────────────┘     │
├─────────────────────────────────────────────────────────────────┤
│                    PLATFORM SPECIFIC                             │
│  ┌───────────────────────┬───────────────────────┐             │
│  │       Android         │         iOS           │             │
│  │      (Java/Kotlin)    │     (Obj-C/Swift)     │             │
│  └───────────────────────┴───────────────────────┘             │
└─────────────────────────────────────────────────────────────────┘
```

### Key Components:

1. **Widgets Layer** - UI building blocks
2. **Rendering Layer** - Layout and painting
3. **Foundation Layer** - Basic classes and services
4. **Engine Layer** - Core runtime (Skia, Dart VM)
5. **Embedder Layer** - Platform-specific code

### Flutter vs React Native (Comparison for MERN Devs):

| Feature | Flutter | React Native |
|---------|---------|--------------|
| **Language** | Dart | JavaScript |
| **UI Components** | Own widgets (Skia) | Native components |
| **Performance** | Near-native | Good (JS Bridge) |
| **Hot Reload** | Yes | Yes |
| **Learning Curve** | New language | Familiar (React) |
| **Code Sharing** | ~95% | ~85% |

---

## 📁 Project Structure

```
my_flutter_app/
├── 📁 android/              # Android native code
│   ├── app/
│   │   ├── build.gradle     # App-level gradle config
│   │   └── src/main/
│   │       ├── AndroidManifest.xml
│   │       └── kotlin/      # Kotlin code
│   └── build.gradle         # Project-level gradle config
│
├── 📁 ios/                  # iOS native code
│   ├── Runner/
│   │   ├── Info.plist       # iOS app configuration
│   │   └── AppDelegate.swift
│   └── Podfile              # CocoaPods dependencies
│
├── 📁 lib/                  # 🎯 YOUR DART CODE GOES HERE
│   ├── main.dart            # Entry point of the app
│   ├── 📁 screens/          # Screen/Page widgets
│   ├── 📁 widgets/          # Reusable widgets
│   ├── 📁 models/           # Data models
│   ├── 📁 services/         # API services, business logic
│   ├── 📁 providers/        # State management
│   └── 📁 utils/            # Helper functions
│
├── 📁 test/                 # Unit & widget tests
│   └── widget_test.dart
│
├── 📁 assets/               # Images, fonts, etc.
│   ├── images/
│   └── fonts/
│
├── 📁 web/                  # Web-specific code
├── 📁 windows/              # Windows-specific code
├── 📁 macos/                # macOS-specific code
├── 📁 linux/                # Linux-specific code
│
├── pubspec.yaml             # 📦 Dependencies (like package.json)
├── pubspec.lock             # Lock file
├── analysis_options.yaml    # Linting rules
└── README.md
```

### pubspec.yaml (Like package.json):

```yaml
name: my_flutter_app
description: A new Flutter project.
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

# Dependencies (like npm packages)
dependencies:
  flutter:
    sdk: flutter
    
  # UI/Design
  cupertino_icons: ^1.0.2
  google_fonts: ^6.1.0
  
  # State Management
  provider: ^6.1.1
  flutter_bloc: ^8.1.3
  
  # Networking
  http: ^1.1.0
  dio: ^5.4.0
  
  # Local Storage
  shared_preferences: ^2.2.2
  hive: ^2.2.3
  
  # Firebase
  firebase_core: ^2.24.2
  firebase_auth: ^4.16.0
  cloud_firestore: ^4.14.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

# Assets configuration
flutter:
  uses-material-design: true
  
  assets:
    - assets/images/
    - assets/icons/
    
  fonts:
    - family: Roboto
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf
        - asset: assets/fonts/Roboto-Bold.ttf
          weight: 700
```

---

## 🧱 Widgets - The Building Blocks

In Flutter, **EVERYTHING is a Widget**! (Like components in React)

### Widget Types:

```
┌─────────────────────────────────────────────────────────────────┐
│                        WIDGETS                                   │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│   ┌───────────────────────┐   ┌───────────────────────┐        │
│   │   STATELESS WIDGET    │   │   STATEFUL WIDGET     │        │
│   │   (No internal state) │   │   (Has internal state)│        │
│   │                       │   │                       │        │
│   │   - Immutable         │   │   - Mutable           │        │
│   │   - build() once      │   │   - setState() to     │        │
│   │   - Static UI         │   │     rebuild           │        │
│   │                       │   │   - Dynamic UI        │        │
│   │   Example:            │   │                       │        │
│   │   - Text              │   │   Example:            │        │
│   │   - Icon              │   │   - Checkbox          │        │
│   │   - Image             │   │   - TextField         │        │
│   │                       │   │   - Forms             │        │
│   └───────────────────────┘   └───────────────────────┘        │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### React Component vs Flutter Widget:

```javascript
// ═══════════════════════════════════════════════════════════
// REACT FUNCTIONAL COMPONENT (What you know)
// ═══════════════════════════════════════════════════════════

// Stateless (No hooks)
const Greeting = ({ name }) => {
    return (
        <div className="greeting">
            <h1>Hello, {name}!</h1>
        </div>
    );
};

// Stateful (With hooks)
const Counter = () => {
    const [count, setCount] = useState(0);
    
    return (
        <div>
            <p>Count: {count}</p>
            <button onClick={() => setCount(count + 1)}>
                Increment
            </button>
        </div>
    );
};
```

```dart
// ═══════════════════════════════════════════════════════════
// FLUTTER WIDGETS (What you'll learn)
// ═══════════════════════════════════════════════════════════

// StatelessWidget (No state)
class Greeting extends StatelessWidget {
  final String name;
  
  const Greeting({super.key, required this.name});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Text(
        'Hello, $name!',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

// StatefulWidget (With state)
class Counter extends StatefulWidget {
  const Counter({super.key});
  
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $count'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: const Text('Increment'),
        ),
      ],
    );
  }
}
```

### Common Widgets Reference:

#### Layout Widgets:
```dart
// ═══════════════════════════════════════════════════════════
// CONTAINER (like <div> in HTML)
// ═══════════════════════════════════════════════════════════
Container(
  width: 200,
  height: 100,
  padding: const EdgeInsets.all(16),
  margin: const EdgeInsets.symmetric(vertical: 8),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  ),
  child: const Text('Hello'),
)

// ═══════════════════════════════════════════════════════════
// ROW (Horizontal layout - like flexbox row)
// ═══════════════════════════════════════════════════════════
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,  // justify-content
  crossAxisAlignment: CrossAxisAlignment.center,      // align-items
  children: [
    const Text('Left'),
    const Text('Center'),
    const Text('Right'),
  ],
)

// ═══════════════════════════════════════════════════════════
// COLUMN (Vertical layout - like flexbox column)
// ═══════════════════════════════════════════════════════════
Column(
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    const Text('Top'),
    const Text('Middle'),
    const Text('Bottom'),
  ],
)

// ═══════════════════════════════════════════════════════════
// STACK (Overlapping elements - like position: absolute)
// ═══════════════════════════════════════════════════════════
Stack(
  children: [
    Container(color: Colors.blue, width: 200, height: 200),
    Positioned(
      top: 10,
      right: 10,
      child: const Icon(Icons.star, color: Colors.white),
    ),
  ],
)

// ═══════════════════════════════════════════════════════════
// LISTVIEW (Scrollable list)
// ═══════════════════════════════════════════════════════════
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index].title),
      subtitle: Text(items[index].subtitle),
      leading: const Icon(Icons.person),
      onTap: () => print('Tapped $index'),
    );
  },
)

// ═══════════════════════════════════════════════════════════
// GRIDVIEW (Grid layout)
// ═══════════════════════════════════════════════════════════
GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
  itemCount: 10,
  itemBuilder: (context, index) {
    return Card(
      child: Center(child: Text('Item $index')),
    );
  },
)
```

#### Input Widgets:
```dart
// ═══════════════════════════════════════════════════════════
// TEXTFIELD (like <input>)
// ═══════════════════════════════════════════════════════════
TextField(
  controller: _textController,  // Like ref in React
  decoration: const InputDecoration(
    labelText: 'Email',
    hintText: 'Enter your email',
    prefixIcon: Icon(Icons.email),
    border: OutlineInputBorder(),
  ),
  keyboardType: TextInputType.emailAddress,
  onChanged: (value) => print('Value: $value'),
)

// ═══════════════════════════════════════════════════════════
// BUTTON VARIANTS
// ═══════════════════════════════════════════════════════════
ElevatedButton(
  onPressed: () => print('Pressed'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
  ),
  child: const Text('Elevated Button'),
)

TextButton(
  onPressed: () {},
  child: const Text('Text Button'),
)

OutlinedButton(
  onPressed: () {},
  child: const Text('Outlined Button'),
)

IconButton(
  onPressed: () {},
  icon: const Icon(Icons.favorite),
)

FloatingActionButton(
  onPressed: () {},
  child: const Icon(Icons.add),
)

// ═══════════════════════════════════════════════════════════
// CHECKBOX, SWITCH, RADIO
// ═══════════════════════════════════════════════════════════
Checkbox(
  value: isChecked,
  onChanged: (value) => setState(() => isChecked = value!),
)

Switch(
  value: isSwitched,
  onChanged: (value) => setState(() => isSwitched = value),
)

Radio<String>(
  value: 'option1',
  groupValue: selectedOption,
  onChanged: (value) => setState(() => selectedOption = value!),
)
```

#### Navigation & Structure:
```dart
// ═══════════════════════════════════════════════════════════
// SCAFFOLD (Page structure with AppBar, Body, etc.)
// ═══════════════════════════════════════════════════════════
Scaffold(
  appBar: AppBar(
    title: const Text('My App'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.settings),
      ),
    ],
  ),
  drawer: Drawer(
    child: ListView(
      children: [
        const DrawerHeader(
          child: Text('Menu'),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {},
        ),
      ],
    ),
  ),
  body: const Center(
    child: Text('Hello World'),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
  bottomNavigationBar: BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ],
  ),
)
```

---

## 🔄 State Management

### State Management Options:

```
┌─────────────────────────────────────────────────────────────────┐
│                 STATE MANAGEMENT OPTIONS                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  SIMPLE                              COMPLEX                     │
│    │                                    │                        │
│    ▼                                    ▼                        │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐        │
│  │ setState │  │ Provider │  │   Bloc   │  │  Riverpod │        │
│  │  (Local) │  │ (Simple) │  │(Enterprise)│ │ (Modern) │        │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘        │
│                                                                  │
│  Built-in       Google         Complex        Type-safe          │
│  No packages    Recommended    Architecture   Compile-time       │
│  Small apps     Medium apps    Large apps     checks             │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

### 1. setState (Built-in - Like useState):
```dart
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Count: $_counter')),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

### 2. Provider (Recommended - Like React Context):

```dart
// ═══════════════════════════════════════════════════════════
// Step 1: Create a ChangeNotifier (Like Context value)
// ═══════════════════════════════════════════════════════════
class CartProvider extends ChangeNotifier {
  final List<Product> _items = [];
  
  List<Product> get items => _items;
  int get itemCount => _items.length;
  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price);
  
  void addItem(Product product) {
    _items.add(product);
    notifyListeners();  // Like calling setState
  }
  
  void removeItem(Product product) {
    _items.remove(product);
    notifyListeners();
  }
  
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

// ═══════════════════════════════════════════════════════════
// Step 2: Wrap app with Provider (Like Context.Provider)
// ═══════════════════════════════════════════════════════════
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

// ═══════════════════════════════════════════════════════════
// Step 3: Consume Provider (Like useContext)
// ═══════════════════════════════════════════════════════════
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Method 1: Consumer widget
    return Consumer<CartProvider>(
      builder: (context, cart, child) {
        return Column(
          children: [
            Text('Items: ${cart.itemCount}'),
            Text('Total: \$${cart.totalPrice}'),
            ...cart.items.map((item) => Text(item.name)),
          ],
        );
      },
    );
  }
}

// Method 2: context.watch (rebuilds on change)
Widget build(BuildContext context) {
  final cart = context.watch<CartProvider>();
  return Text('Items: ${cart.itemCount}');
}

// Method 3: context.read (doesn't rebuild - for actions)
void addToCart(BuildContext context, Product product) {
  context.read<CartProvider>().addItem(product);
}
```

### 3. Riverpod (Modern & Type-Safe):

```dart
// ═══════════════════════════════════════════════════════════
// Define providers (outside of widgets)
// ═══════════════════════════════════════════════════════════

// Simple state
final counterProvider = StateProvider<int>((ref) => 0);

// Computed/Derived state
final doubleCounterProvider = Provider<int>((ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
});

// Async state (like React Query)
final userProvider = FutureProvider<User>((ref) async {
  final response = await http.get(Uri.parse('api/user'));
  return User.fromJson(jsonDecode(response.body));
});

// ═══════════════════════════════════════════════════════════
// Use in widgets
// ═══════════════════════════════════════════════════════════
class CounterPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    
    return ElevatedButton(
      onPressed: () => ref.read(counterProvider.notifier).state++,
      child: Text('Count: $count'),
    );
  }
}
```

### 4. BLoC Pattern (Enterprise - Like Redux):

```dart
// ═══════════════════════════════════════════════════════════
// Events (Like Redux Actions)
// ═══════════════════════════════════════════════════════════
abstract class CounterEvent {}
class IncrementEvent extends CounterEvent {}
class DecrementEvent extends CounterEvent {}

// ═══════════════════════════════════════════════════════════
// State
// ═══════════════════════════════════════════════════════════
class CounterState {
  final int count;
  CounterState(this.count);
}

// ═══════════════════════════════════════════════════════════
// Bloc (Like Redux Reducer + Store)
// ═══════════════════════════════════════════════════════════
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(state.count + 1));
    });
    
    on<DecrementEvent>((event, emit) {
      emit(CounterState(state.count - 1));
    });
  }
}

// ═══════════════════════════════════════════════════════════
// Use in widgets
// ═══════════════════════════════════════════════════════════
BlocBuilder<CounterBloc, CounterState>(
  builder: (context, state) {
    return Text('Count: ${state.count}');
  },
)

// Dispatch events
context.read<CounterBloc>().add(IncrementEvent());
```

---

## 🧭 Navigation & Routing

### Basic Navigation (Like React Router):

```dart
// ═══════════════════════════════════════════════════════════
// METHOD 1: Navigator.push (Simple)
// ═══════════════════════════════════════════════════════════

// Navigate to new page
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const DetailPage()),
);

// Navigate and pass data
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(productId: 123),
  ),
);

// Go back
Navigator.pop(context);

// Go back with result
Navigator.pop(context, 'Result data');

// Navigate and remove all previous routes (like replace)
Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => const HomePage()),
  (route) => false,
);

// ═══════════════════════════════════════════════════════════
// METHOD 2: Named Routes (Recommended for larger apps)
// ═══════════════════════════════════════════════════════════

// Define routes in MaterialApp
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const HomePage(),
    '/login': (context) => const LoginPage(),
    '/profile': (context) => const ProfilePage(),
    '/product': (context) => const ProductPage(),
  },
  // For routes with parameters
  onGenerateRoute: (settings) {
    if (settings.name == '/product-detail') {
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => ProductDetailPage(id: args['id']),
      );
    }
    return null;
  },
);

// Navigate using named routes
Navigator.pushNamed(context, '/login');

// Navigate with arguments
Navigator.pushNamed(
  context,
  '/product-detail',
  arguments: {'id': 123},
);

// ═══════════════════════════════════════════════════════════
// METHOD 3: GoRouter (Modern - Like React Router v6)
// ═══════════════════════════════════════════════════════════

// pubspec.yaml: go_router: ^13.0.0

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ProductPage(id: id);
      },
    ),
    // Nested routes
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(path: '/home', builder: (_, __) => const HomePage()),
        GoRoute(path: '/search', builder: (_, __) => const SearchPage()),
        GoRoute(path: '/profile', builder: (_, __) => const ProfilePage()),
      ],
    ),
  ],
  // Redirect for auth
  redirect: (context, state) {
    final isLoggedIn = authService.isLoggedIn;
    final isLoginPage = state.matchedLocation == '/login';
    
    if (!isLoggedIn && !isLoginPage) return '/login';
    if (isLoggedIn && isLoginPage) return '/';
    return null;
  },
);

// Use in app
MaterialApp.router(
  routerConfig: router,
);

// Navigate
context.go('/product/123');
context.push('/profile');
context.pop();
```

---

## 🔄 MERN vs Flutter Comparison

### Complete Concept Mapping:

| MERN Concept | Flutter Equivalent | Notes |
|--------------|-------------------|-------|
| `<div>` | `Container` | Basic box container |
| `<span>` | `Text` | Text display |
| `<img>` | `Image.network()` / `Image.asset()` | Image display |
| `<input>` | `TextField` | Text input |
| `<button>` | `ElevatedButton`, `TextButton` | Clickable button |
| `<ul>/<li>` | `ListView` | List of items |
| `flexbox` | `Row` / `Column` | Layout |
| `CSS grid` | `GridView` | Grid layout |
| `position: absolute` | `Stack` + `Positioned` | Overlapping elements |
| `useState` | `setState` | Local state |
| `useContext` | `Provider` | Global state |
| `Redux` | `BLoC` / `Riverpod` | Complex state |
| `React Router` | `Navigator` / `GoRouter` | Navigation |
| `npm` | `pub` | Package manager |
| `package.json` | `pubspec.yaml` | Dependencies |
| `axios/fetch` | `http` / `dio` | HTTP requests |
| `localStorage` | `SharedPreferences` | Local storage |
| `PropTypes` | Dart's type system | Type checking |
| `ESLint` | `analysis_options.yaml` | Linting |
| `Jest` | `flutter_test` | Testing |
| `npm start` | `flutter run` | Start dev |
| `npm build` | `flutter build` | Build for production |

### Code Comparison - Complete Example:

```javascript
// ═══════════════════════════════════════════════════════════
// REACT (Login Page)
// ═══════════════════════════════════════════════════════════
import { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

const LoginPage = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState('');
    const navigate = useNavigate();
    
    const handleLogin = async (e) => {
        e.preventDefault();
        setLoading(true);
        setError('');
        
        try {
            const response = await axios.post('/api/login', {
                email,
                password
            });
            localStorage.setItem('token', response.data.token);
            navigate('/dashboard');
        } catch (err) {
            setError(err.response?.data?.message || 'Login failed');
        } finally {
            setLoading(false);
        }
    };
    
    return (
        <div className="login-container">
            <h1>Login</h1>
            {error && <p className="error">{error}</p>}
            <form onSubmit={handleLogin}>
                <input
                    type="email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    placeholder="Email"
                />
                <input
                    type="password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="Password"
                />
                <button type="submit" disabled={loading}>
                    {loading ? 'Loading...' : 'Login'}
                </button>
            </form>
        </div>
    );
};
```

```dart
// ═══════════════════════════════════════════════════════════
// FLUTTER (Login Page)
// ═══════════════════════════════════════════════════════════
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;
  String _error = '';

  Future<void> _handleLogin() async {
    setState(() {
      _loading = true;
      _error = '';
    });

    try {
      final response = await http.post(
        Uri.parse('https://api.example.com/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': _emailController.text,
          'password': _passwordController.text,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', data['token']);
        
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/dashboard');
        }
      } else {
        final data = jsonDecode(response.body);
        setState(() => _error = data['message'] ?? 'Login failed');
      }
    } catch (e) {
      setState(() => _error = 'Network error');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            if (_error.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.red.shade100,
                child: Text(_error, style: const TextStyle(color: Colors.red)),
              ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _loading ? null : _handleLogin,
                child: _loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

---

## 📦 Common Flutter Packages

### Essential Packages (Like npm packages):

```yaml
# ═══════════════════════════════════════════════════════════
# NETWORKING (Like Axios)
# ═══════════════════════════════════════════════════════════
dependencies:
  http: ^1.1.0           # Simple HTTP client
  dio: ^5.4.0            # Advanced HTTP client (interceptors, etc.)
  retrofit: ^4.0.3       # Type-safe REST client

# ═══════════════════════════════════════════════════════════
# STATE MANAGEMENT
# ═══════════════════════════════════════════════════════════
  provider: ^6.1.1       # Google recommended
  flutter_bloc: ^8.1.3   # BLoC pattern
  riverpod: ^2.4.9       # Modern state management
  get: ^4.6.6            # GetX (all-in-one)

# ═══════════════════════════════════════════════════════════
# LOCAL STORAGE (Like localStorage)
# ═══════════════════════════════════════════════════════════
  shared_preferences: ^2.2.2    # Key-value storage
  hive: ^2.2.3                  # Fast NoSQL database
  sqflite: ^2.3.2               # SQLite database
  isar: ^3.1.0                  # Modern database

# ═══════════════════════════════════════════════════════════
# NAVIGATION
# ═══════════════════════════════════════════════════════════
  go_router: ^13.0.0     # Declarative routing
  auto_route: ^7.8.4     # Code generation routing

# ═══════════════════════════════════════════════════════════
# UI COMPONENTS
# ═══════════════════════════════════════════════════════════
  google_fonts: ^6.1.0         # Google Fonts
  flutter_svg: ^2.0.9          # SVG support
  cached_network_image: ^3.3.1 # Image caching
  shimmer: ^3.0.0              # Loading shimmer effect
  lottie: ^3.0.0               # Lottie animations
  flutter_animate: ^4.3.0      # Easy animations

# ═══════════════════════════════════════════════════════════
# FORMS & VALIDATION
# ═══════════════════════════════════════════════════════════
  flutter_form_builder: ^9.1.1  # Form builder
  form_validator: ^2.1.1        # Validation

# ═══════════════════════════════════════════════════════════
# FIREBASE (Like Firebase for React)
# ═══════════════════════════════════════════════════════════
  firebase_core: ^2.24.2
  firebase_auth: ^4.16.0
  cloud_firestore: ^4.14.0
  firebase_storage: ^11.6.0
  firebase_messaging: ^14.7.10

# ═══════════════════════════════════════════════════════════
# UTILITIES
# ═══════════════════════════════════════════════════════════
  intl: ^0.19.0                 # Internationalization
  url_launcher: ^6.2.2          # Open URLs
  share_plus: ^7.2.1            # Share content
  image_picker: ^1.0.7          # Pick images
  permission_handler: ^11.2.0   # Handle permissions
  connectivity_plus: ^5.0.2     # Network connectivity
  flutter_secure_storage: ^9.0.0 # Secure storage

# ═══════════════════════════════════════════════════════════
# DEV DEPENDENCIES
# ═══════════════════════════════════════════════════════════
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  mockito: ^5.4.4              # Mocking for tests
  build_runner: ^2.4.8         # Code generation
  json_serializable: ^6.7.1    # JSON serialization
```

### Installing Packages:

```bash
# Add package (like npm install)
flutter pub add http

# Add dev dependency (like npm install --save-dev)
flutter pub add --dev mockito

# Get all packages (like npm install)
flutter pub get

# Upgrade packages (like npm update)
flutter pub upgrade

# Remove package (like npm uninstall)
flutter pub remove http
```

---

## ✅ Best Practices

### 1. Widget Structure:
```dart
// ✅ GOOD: Separate widgets into smaller components
class ProductCard extends StatelessWidget {
  final Product product;
  
  const ProductCard({super.key, required this.product});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ProductImage(url: product.imageUrl),
          ProductInfo(product: product),
          ProductActions(product: product),
        ],
      ),
    );
  }
}

// ❌ BAD: One huge widget with everything
class BadProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // 100+ lines of code here...
        ],
      ),
    );
  }
}
```

### 2. Use const Constructors:
```dart
// ✅ GOOD: Use const for immutable widgets
const Text('Hello');
const SizedBox(height: 16);
const EdgeInsets.all(16);

// ❌ BAD: Missing const
Text('Hello');
SizedBox(height: 16);
EdgeInsets.all(16);
```

### 3. Folder Structure:
```
lib/
├── core/                    # Core functionality
│   ├── constants/           # App constants
│   ├── theme/               # Theme data
│   ├── utils/               # Utility functions
│   └── extensions/          # Dart extensions
│
├── data/                    # Data layer
│   ├── models/              # Data models
│   ├── repositories/        # Data repositories
│   └── datasources/         # API, local storage
│
├── presentation/            # UI layer
│   ├── screens/             # Full pages
│   ├── widgets/             # Reusable widgets
│   └── providers/           # State providers
│
├── services/                # Business logic
│   ├── auth_service.dart
│   ├── api_service.dart
│   └── storage_service.dart
│
└── main.dart
```

### 4. Error Handling:
```dart
// ✅ GOOD: Proper error handling
Future<void> fetchData() async {
  try {
    setState(() => _loading = true);
    final data = await apiService.getData();
    setState(() => _data = data);
  } on SocketException {
    _showError('No internet connection');
  } on HttpException catch (e) {
    _showError('Server error: ${e.message}');
  } catch (e) {
    _showError('Something went wrong');
  } finally {
    setState(() => _loading = false);
  }
}
```

### 5. Dispose Resources:
```dart
class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late TextEditingController _controller;
  late StreamSubscription _subscription;
  
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _subscription = stream.listen((data) {});
  }
  
  @override
  void dispose() {
    // ✅ Always dispose controllers and subscriptions
    _controller.dispose();
    _subscription.cancel();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) => Container();
}
```

---

## 📚 Learning Roadmap

### Week 1-2: Dart Fundamentals
- [ ] Variables, data types, null safety
- [ ] Functions and closures
- [ ] Classes and OOP
- [ ] Collections (List, Map, Set)
- [ ] Async programming (Future, Stream)

### Week 3-4: Flutter Basics
- [ ] Widget tree concept
- [ ] StatelessWidget vs StatefulWidget
- [ ] Basic widgets (Container, Row, Column, Stack)
- [ ] Material Design widgets
- [ ] Layout and responsive design

### Week 5-6: Navigation & State
- [ ] Navigation basics
- [ ] Named routes
- [ ] GoRouter
- [ ] setState
- [ ] Provider pattern

### Week 7-8: Data & APIs
- [ ] HTTP requests with http/dio
- [ ] JSON parsing
- [ ] Local storage
- [ ] Forms and validation

### Week 9-10: Advanced Topics
- [ ] Animations
- [ ] Custom widgets
- [ ] Platform channels
- [ ] Firebase integration
- [ ] Testing

### Week 11-12: Production Ready
- [ ] App performance optimization
- [ ] Error handling
- [ ] CI/CD setup
- [ ] Publishing to stores

---

## 📖 Resources

### Official Documentation:
- [Flutter Docs](https://docs.flutter.dev/)
- [Dart Docs](https://dart.dev/guides)
- [Flutter API Reference](https://api.flutter.dev/)
- [Flutter Cookbook](https://docs.flutter.dev/cookbook)

### YouTube Channels:
- [Flutter Official](https://www.youtube.com/c/flutterdev)
- [The Net Ninja](https://www.youtube.com/c/TheNetNinja)
- [Fireship](https://www.youtube.com/c/Fireship)
- [Code With Andrea](https://www.youtube.com/c/CodeWithAndrea)

### Courses:
- [Flutter & Dart - Complete Guide (Udemy)](https://www.udemy.com/course/learn-flutter-dart-to-build-ios-android-apps/)
- [Flutter Apprentice (raywenderlich)](https://www.raywenderlich.com/books/flutter-apprentice)
- [Flutter Bootcamp (App Brewery)](https://www.appbrewery.co/p/flutter-development-bootcamp-with-dart)

### Useful Websites:
- [pub.dev](https://pub.dev/) - Package repository
- [Flutter Gems](https://fluttergems.dev/) - Curated packages
- [It's All Widgets](https://itsallwidgets.com/) - Widget catalog
- [Flutter Awesome](https://flutterawesome.com/) - Resources & projects

### Practice Projects:
1. **Todo App** - State management basics
2. **Weather App** - API integration
3. **E-commerce App** - Complex state & navigation
4. **Chat App** - Real-time with Firebase
5. **Social Media Clone** - Full-stack with backend

---

## 🎉 Quick Start Commands

```bash
# Create new project
flutter create my_app

# Run on connected device/emulator
flutter run

# Run on specific device
flutter run -d chrome        # Web
flutter run -d windows       # Windows
flutter run -d macos         # macOS
flutter run -d <device_id>   # Specific device

# List connected devices
flutter devices

# Hot reload (when running)
# Press 'r' in terminal

# Hot restart
# Press 'R' in terminal

# Build for production
flutter build apk            # Android APK
flutter build appbundle      # Android App Bundle (for Play Store)
flutter build ios            # iOS
flutter build web            # Web
flutter build windows        # Windows

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
dart format .

# Clean build
flutter clean
```

---

## 🎯 Your First Flutter App

Create a simple counter app to get started:

```dart
// lib/main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

---

**Welcome to Flutter! 🚀**

As a MERN developer, you'll find many familiar concepts. The transition will be smooth since you already understand component-based architecture, state management, and async programming.

**Happy Coding!** 💙
