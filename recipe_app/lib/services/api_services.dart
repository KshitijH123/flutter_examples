import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/model/recipe_model.dart';

class ApiServices {
  ApiServices._();

  static final ApiServices instance = ApiServices._();

  final recipeUrl = 'https://dummyjson.com/recipes';

  Future<List<RecipeModel>?> fetchRecipes() async {
    final response = await http.get(Uri.parse(recipeUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> recipesJson = data['recipes'];
      return recipesJson.map((json) => RecipeModel.fromJson(json)).toList();
    }
    return null;
  } 
}
