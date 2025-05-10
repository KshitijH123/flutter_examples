import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> todos = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  void addTodo() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Add Todo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: "Title"),
                ),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(labelText: "Description"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  titleController.clear();
                  descController.clear();
                  Navigator.pop(context);
                },
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  if (titleController.text.isNotEmpty &&
                      descController.text.isNotEmpty) {
                    setState(() {
                      todos.add({
                        "title": titleController.text,
                        "desc": descController.text,
                      });
                    });
                    titleController.clear();
                    descController.clear();
                    Navigator.pop(context);
                  }
                },
                child: Text("Save"),
              ),
            ],
          ),
    );
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Todo List")),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(todo['title']!),
              subtitle: Text(todo['desc']!),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteTodo(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
