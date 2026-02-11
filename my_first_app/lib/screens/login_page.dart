import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[600],
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}, child: Text(":-)")),
        drawer: Container(
          width: 400,
          height: 500,
          color: Colors.red,
        ),
        body: Column(
          children: [
            Text("Hello welcome to flutter",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.purple[600],
              
            ),
            ),
            SizedBox(height: 20, width: 20),
            Text("Login to continue",
            ),
            SizedBox(height: 20, width: 500, child: Text("this is text inside sized box"),),
            TextField(

              decoration: InputDecoration(
                hintText: "Enter your name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                 fillColor: Colors.grey[200],
                  filled:true,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Enter your password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                  fillColor: Colors.grey[200],
                  filled:true,
              ),
            ),
            // TextButton(onPressed: (){print('clicked');}, child: Text("Forgot Password hy?")),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: (){print('clicked');},style: TextButton.styleFrom(foregroundColor: Colors.blue), child: Text("Forgot Password hy?")),
            ),
            // ElevatedButton(onPressed: () {}, child: Text("Login")),
             
             SizedBox(
              width: 250,
              child: ElevatedButton(onPressed: () {}, child: Text("Login"), style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Colors.white,
              )),
             ),

            // Text('Or sign in with'),

              SizedBox(height: 20, width: 20),
              Text('Or sign in with', style: TextStyle(fontSize: 16, color: Colors.grey),),
              SizedBox(height: 20, width: 20),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/google.jpg',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(width: 10),
                  Text("Sign in with Google")
                ],
              ),
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[800],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),  
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/fb.jpg',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(width: 10),
                  Text("Sign in with Facebook")
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}