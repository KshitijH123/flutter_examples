import 'package:flutter/material.dart';
import 'package:food_api/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

