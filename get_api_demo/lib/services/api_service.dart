import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryDetailService {
  CategoryDetailService._();

  static final CategoryDetailService instance = CategoryDetailService._();

  static const String _baseUrl = 'https://dummyjson.com/products/category-list';

  Future<List<String>> fetchCategories() async {
   
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode != 200) return [];

      final decoded = json.decode(response.body);
      if (decoded is List) return decoded.cast<String>();

      return [];
    } 
  }

