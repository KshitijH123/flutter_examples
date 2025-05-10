import 'package:bloc_demo/todo_bloc.dart';
import 'package:bloc_demo/todo_event.dart';
import 'package:bloc_demo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    void showAddDialog() {
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
                      context.read<TodoBloc>().add(
                        AddTodo(titleController.text, descController.text),
                      );
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

    return Scaffold(
      appBar: AppBar(title: Text("Todo List (BLoC)")),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(todo['title']!),
                  subtitle: Text(todo['desc']!),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      context.read<TodoBloc>().add(DeleteTodo(index));
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
