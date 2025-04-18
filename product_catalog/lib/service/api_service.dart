import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_catalog/model/product_model.dart';

class ApiService {
  final String apiUrl = "https://dummyjson.com/products";

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List productsJson = jsonData['products'];

        return productsJson.map((item) => Product.fromJson(item)).toList();
      }
    } catch (e) {}
    return [];
  }
}
