import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier{
   final List<Map<String, String>> _todos = [];

  List<Map<String, String>> get todos => _todos;

  void addTodo(String title, String desc) {
    _todos.add({"title": title, "desc": desc});
    notifyListeners();
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}