import 'package:flutter/material.dart';
import 'package:navigator_app/third_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ThirdScreen()),
            );

            if (result != null && result is String) {
              Navigator.pop(
                context,
                result,
              ); 
            }
          },
          child: const Text("Next Page", style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
