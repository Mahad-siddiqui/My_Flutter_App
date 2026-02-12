// import 'package:flutter/material.dart';
// import 'screens/login_screen.dart';
// import 'screens/home_screen.dart';
// import 'services/auth_service.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Todo App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const SplashScreen(),
//     );
//   }
// }

// // SplashScreen - Checks if user is logged in
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _checkLoginStatus();
//   }

//   // Check if user is already logged in
//   Future<void> _checkLoginStatus() async {
//     await Future.delayed(const Duration(seconds: 1)); // Show splash for 1 second

//     final isLoggedIn = await AuthService.isLoggedIn();

//     if (mounted) {
//       if (isLoggedIn) {
//         // User is logged in, go to home
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const HomeScreen()),
//         );
//       } else {
//         // User not logged in, go to login
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginScreen()),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.check_circle,
//               size: 100,
//               color: Colors.blue,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Todo App',
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             SizedBox(height: 20),
//             CircularProgressIndicator(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       body: Container(color: Colors.red),
//     ),
//   ));
// }

// import 'package:flutter/material.dart';

// void main() {
//   // runApp(Container(color: Colors.blue));
//   runApp(MaterialApp(
//     // home:Text('Hello World'),

//     // home:Material(
//     //   child: Text('Hello World'),
//     // ),

//     home:Material(
//       child:Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Hello World'),
//           Text('Welcome to Flutter'),
//           ElevatedButton(onPressed: (){}, child: Text('Click Me'))
//         ],
//       )
//     )

//   ));
// }

// void main(){
//   runApp(MaterialApp(
//     home:Material(
//       child:Column(
//         children: [
//           Text('Hello World'),
//           Text('Welcome to Flutter'),
//           ElevatedButton(onPressed: (){}, child: Text('Click Me')),
//           MyApp(),
//         ],
//       )
//     )
//   ));
// }

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//    return Text("Text is widget that displays a string of text with single style. The Text widget has many properties to control how the text is displayed, such as its color, font, size, and more.");
//   }
// }

// void main(){
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget{

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: Material(
//         color: Colors.cyan,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Hello welcome to flutter"),
//             Text("Login to continue"),
//             ElevatedButton(onPressed: (){}, child: Text("Click Me"))
//           ],
//         )
//       )
//     );
//   }
// }

  


import 'package:flutter/material.dart';
import 'package:my_first_app/screens/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // my login page is in screens/login_page.dart
    );
  }
}
