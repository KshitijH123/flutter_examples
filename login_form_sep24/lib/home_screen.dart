import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Text('Wellcome to Home Page $username !', style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
      ),
    );
  }
}
