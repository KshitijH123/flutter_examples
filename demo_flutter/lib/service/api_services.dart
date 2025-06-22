import 'dart:convert';
import 'package:demo_flutter/model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://dummyjson.com/products';

  Future<List<Product>> fetchProduct() async {
    try {
      final responce = await http.get(Uri.parse(baseUrl));

      if (responce.statusCode == 200) {
        final jsonData = json.decode(responce.body);
        final List productsJson = jsonData['products'];

        return productsJson.map((item) => Product.fromJson(item)).toList();
      }
    } catch (e) {}
    return [];
  }
}
