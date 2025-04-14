import 'package:flutter/material.dart';
import 'package:navigator_app/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => ThirdScreen()));
          }, child: Text("Next Page", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}