import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:post_api_demo/model/post_model.dart';

class PostService {
  PostService._();
  static final PostService instance = PostService._(); 

  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    } 
  }
}
