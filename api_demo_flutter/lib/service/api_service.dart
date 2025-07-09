import 'dart:convert';

import 'package:api_demo_flutter/model/comment_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static final ApiService instance = ApiService._();
  final String CommentUrl =
      "https://jsonplaceholder.typicode.com/comments?postId=1";

  Future<List<CommentModel>> fetchComment() async {
    final responce = await http.get(Uri.parse(CommentUrl));

    if (responce.statusCode == 200) {
      final List<dynamic> data = jsonDecode(responce.body);
      return data.map((json) => CommentModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
