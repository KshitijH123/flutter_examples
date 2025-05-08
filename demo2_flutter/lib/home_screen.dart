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
          constraints: BoxConstraints(minWidth: 100, minHeight: 100),
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
