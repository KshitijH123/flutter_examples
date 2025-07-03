import 'dart:convert';

import 'package:get_api_demo/model/model.dart';
import 'package:http/http.dart' as http;

class CategoryDetailService {
  CategoryDetailService._();
  static const String _baseUrl = 'https://dummyjson.com/products/categories';

  Future<List<ProductModel>> fetchCategories() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      return[];
    }
  }
}
