import 'package:flutter/material.dart';
import 'package:recepie_api/screens/recepie_list_screen.dart';

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
      home: const RecipeListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

