import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page'),
      centerTitle: true,
      elevation: 2,
      ),
   body: Center(
     child: Column(
       children: [
         TextField(
         ),
         TextField(
          
         )
       ],
     ),
   ),
    );
  }
}

// we have to do login for teacher and students.
// for teacher there will be all functions like  add student edit student and all.
// for students there will be onlt ui no additional functions. 
// differnt ligin for teacher and students.