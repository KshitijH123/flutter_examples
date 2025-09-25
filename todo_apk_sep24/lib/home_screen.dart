import 'package:flutter/material.dart';
import 'package:todo_apk_sep24/add_item.dart';
import 'package:todo_apk_sep24/model/todo_item_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoItemModel> todoItems = [];

  void deleteTodoItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                todoItems.removeAt(index);
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Column(
        children: [
          const Center(child: Text('Welcome to the Todo List App!')),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final item = todoItems[index];

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.discription),
                  trailing: InkWell(
                    onTap: () {
                      deleteTodoItem(index);
                    },
                    child: Icon(Icons.delete),
                  ),
                );
              },
              itemCount: todoItems.length,
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final item = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItem()),
          );

          todoItems.add(item);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
