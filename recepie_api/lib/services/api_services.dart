import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recepie_api/model/recepie_model.dart';


class ApiServices {
  ApiServices._();

  static final ApiServices instance = ApiServices._();

  final recipeUrl = 'https://dummyjson.com/recipes';

  Future<List<RecipeModel>> fetchRecipes() async {
    try {
      final response = await http.get(Uri.parse(recipeUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> recipesJson = data['recipes'];
        return recipesJson.map((json) => RecipeModel.fromJson(json)).toList();
      } else {
        throw ('Failed to load recipes');
      }
    } catch (e) {
      throw ('Error fetching recipes: $e');
    }
  }
}
