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
  Future<List<Review>> fetchReviews(int productId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/$productId'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List reviewsJson = jsonData['reviews'] ?? [];

        return reviewsJson.map((r) {
          return Review(
            reviewerName: r['user'] ?? 'Anonymous',
            rating: r['rating'] ?? 0,
            comment: r['comment'] ?? '',
            date: DateTime.now(),
          );
        }).toList();
      }
    } catch (e) {}
    return [];
  }
}
