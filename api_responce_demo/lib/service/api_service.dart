import 'dart:convert';

import 'package:api_responce_demo/model/posts_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static final ApiService instance = ApiService._();

  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> fetchModel() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => PostModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
