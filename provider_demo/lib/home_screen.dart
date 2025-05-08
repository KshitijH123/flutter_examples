import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/provider/todo_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  void addTodoDialog(BuildContext context) {
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
                    Provider.of<TodoProvider>(
                      context,
                      listen: false,
                    ).addTodo(titleController.text, descController.text);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple Todo List", style:TextStyle(fontWeight: FontWeight.bold),),
      centerTitle: true,
      elevation: 2,
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (context, index) {
              final todo = provider.todos[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(todo['title']!),
                  subtitle: Text(todo['desc']!),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => provider.deleteTodo(index),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addTodoDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
