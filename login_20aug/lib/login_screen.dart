import 'package:flutter/material.dart';
import 'package:login_20aug/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login() {
    String name = nameController.text.trim();
    String password = passwordController.text.trim();

    if (password == 'Kshitij@123' && name == 'Kshitij123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(username: name)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Failed')));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 24,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'User Name',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(onPressed: login, child: Text('Login')),
            ],
          ),
        ),

      ),
    );
  }
}
