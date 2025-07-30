import 'dart:convert';

import 'package:api_yt/model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static final ApiService instance = ApiService._();

  static String baseUrl = 'https://jsonplaceholder.typicode.com/posts/';

  Future<List<PostModel>> fetchPost() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => PostModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
