import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/todo_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final titleController = TextEditingController();
    final descController = TextEditingController();

    void showAddTodoDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add Todo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(labelText: "Description"),
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
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  final title = titleController.text;
                  final desc = descController.text;
                  if (title.isNotEmpty && desc.isNotEmpty) {
                    ref.read(todoProvider.notifier).addTodo(title, desc);
                    titleController.clear();
                    descController.clear();
                    Navigator.pop(context);
                  }
                },
                child: const Text("Save"),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Todo List")),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(todo['title']!),
              subtitle: Text(todo['desc']!),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed:
                    () => ref.read(todoProvider.notifier).deleteTodo(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddTodoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
