import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_api/model/todo.dart';

class ApiService {
  ApiService._();

  static final ApiService instance = ApiService._();

  final todoUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Todo>> fetchTodo() async {
    try {
      final responce = await http.get(Uri.parse(todoUrl));

      if (responce.statusCode == 200) {
        final List<dynamic> data = jsonDecode(responce.body);

        return data.map((json) => Todo.fromJson(json)).toList();
      } else {
        print('Failed to load todo.statusCode: ${responce.statusCode}');
      }
      return [];
    } catch (e) {}
    return [];
  }
}
