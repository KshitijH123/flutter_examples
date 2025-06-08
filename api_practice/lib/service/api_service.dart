import 'dart:convert';

import 'package:api_practice/model/quote.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices._();

  static final ApiServices instance = ApiServices._();
  final QuoteUrl = "https://dummyjson.com/quotes";

  Future<List<Quote>> fetchQuote() async {
    try {
      final responce = await http.get(Uri.parse(QuoteUrl));

      if (responce.statusCode == 200) {
        final data = json.decode(responce.body);
        final List<dynamic> quoteJson = data['quotes'];
        return quoteJson.map((json) => Quote.fromJson(json)).toList();
      } else {
        throw ('failed to load');
      }
    } catch (e) {
      throw ("error fetching $e");
    }
  }
}
