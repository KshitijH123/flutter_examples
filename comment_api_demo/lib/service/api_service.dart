import 'dart:convert';

import 'package:comment_api_demo/model/comment_list.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static final ApiService instance = ApiService._();

  static String baseUrl = 'https://dummyjson.com/comments';

 Future<List<Comment>> fetchComments() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final commentList = CommentList.fromJson(jsonData);
      return commentList.comments;
    } else {
      return [];
    }
  }
}
