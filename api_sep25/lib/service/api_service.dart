import 'dart:convert';

import 'package:api_sep25/model/recepie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static final ApiService instance = ApiService._();

  final String baseUrl = 'https://dummyjson.com/recipes';

  Future<List<RecepieModel>> fetchRecepies() async {
    final responce = await http.get(Uri.parse(baseUrl));

    if (responce.statusCode == 200) {
      final jsonData = jsonDecode(responce.body);
      final List<dynamic> recipes = jsonData['recipes'];
      return recipes.map((json) => RecepieModel.fromJson(json)).toList();
    }
    return [];
  }
}
