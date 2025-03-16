
import 'package:flutter/material.dart';
import 'package:navigator_app/second_screen.dart';

class DynamicTextScreen extends StatefulWidget {
  final String text;

  const DynamicTextScreen({super.key, required this.text});

  @override
   _DynamicTextScreenState createState() => _DynamicTextScreenState();
}

class _DynamicTextScreenState extends State<DynamicTextScreen> {
  String displayedText = '';

  @override
  void initState() {
    super.initState();
    displayedText = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dynamic Text Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayedText,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );

                if (result != null && result is String) {
                  setState(() {
                    displayedText = result;
                  });
                }
              },
              child: const Text("Next Page", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

