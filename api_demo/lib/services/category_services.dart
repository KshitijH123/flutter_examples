import 'dart:convert';
import 'package:api_demo/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  CategoryService._();

  static final CategoryService instance = CategoryService._();

  final String categoryUrl = 'https://dummyjson.com/products/categories';

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(categoryUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((slug) => CategoryModel.fromJson(slug)).toList();
      } else {
        throw ('Failed to load categories');
      }
    } catch (e) {
      throw ('Error fetching categories: $e');
    }
  }
}
