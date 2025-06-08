import 'dart:convert';

import 'package:api_practice/model/quote.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices._();

  static final ApiServices instance = ApiServices._();
  final quoteUrl = "https://dummyjson.com/quotes";

  Future<List<Quote>?> fetchQuote() async {
    final responce = await http.get(Uri.parse(quoteUrl));

    if (responce.statusCode == 200) {
      final data = json.decode(responce.body);
      final List<dynamic> quoteJson = data['quotes'];
      return quoteJson.map((json) => Quote.fromJson(json)).toList();
    }

    return null;
  }
}
