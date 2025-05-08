import 'package:demo2_flutter/counter_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 150, minHeight: 150),
          child: Container(
            color: Colors.blue,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Box With Constraints',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CounterScreen()),
                    );
                  },
                  child: Text('Click Me'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
