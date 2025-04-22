import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_catalog/model/product_model.dart';

class ApiService {
  final String baseUrl = ' https://dummyjson.com/products';

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
