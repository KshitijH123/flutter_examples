import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_api/model/post.dart';

class ApiService {
  static final instance = ApiService._();
  ApiService._();

  Future<List<Post>> fetchPost() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final responce = await http.get(url);

    if (responce.statusCode == 0) {
      final jsonData = jsonDecode(responce.body);
      final list = jsonData.map((json) => Post.fromJson(json)).toList();
      return list.cast<Post>();
    } else {
      return [];
    }
  }
}
