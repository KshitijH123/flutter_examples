
import 'package:flutter/material.dart';
import 'package:navigator_app/second_screen.dart';

class DynamicTextScreen extends StatefulWidget {
  final String text;

  const DynamicTextScreen({super.key, required this.text});

  @override
   _DynamicTextScreenState createState() => _DynamicTextScreenState();
}

class _DynamicTextScreenState extends State<DynamicTextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dynamic Text Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text, 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              child: const Text("Next Page", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
