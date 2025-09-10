import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.username});
  final String username;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.red[300],
        title: Text('Home Screen',style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400,color: Colors.white70),),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(child: Text('Welcome , ${widget.username}!',style: TextStyle(fontSize: 24, fontWeight:  FontWeight.w500),),),
    );
  }
}
