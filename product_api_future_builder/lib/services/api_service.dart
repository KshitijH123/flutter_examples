import 'dart:convert';

import 'package:api_future_builder/model/category.dart';
import 'package:api_future_builder/model/product.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  final categoriesUrl = 'https://dummyjson.com/products/categories';

  static ApiService instance = ApiService._();

  Future<List<Category>> fetchAllCategories() async {
    final url = Uri.parse(categoriesUrl);

    final result = await http.get(url);
    if (result.statusCode == 200) {
      final response = jsonDecode(result.body);
      final listOfMap = response as List;

      final categories =
          listOfMap.map((json) => Category.fromJson(json)).toList();
      return categories;
    }

    return [];
  }

  Future<List<Product>> fetchAllProducts(String url) async {
    final result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      final response = jsonDecode(result.body);
      final listOfMap = (response as Map)['products'] as List;

      final products = listOfMap.map((json) => Product.fromJson(json)).toList();

      return products;
    }

    return [];
  }
}
