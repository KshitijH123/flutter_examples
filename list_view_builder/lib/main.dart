import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView Example')),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.list),
              title: Text(items[index]),
              subtitle: Text('Subtitle ${index + 1}'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print('Tapped on ${items[index]}');
              },
            );
          },
        ),
      ),
    );
  }
}
