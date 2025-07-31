import 'dart:convert';

import 'package:fort_demo/model/fort_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService._();

  static final ApiService instance = ApiService._();

  final String baseUrl =
      'https://mocki.io/v1/6923fcff-f188-4bce-a9ff-12e5a5af16b8';

  Future<List<FortModel>> fetchModel() async {
    final responce = await http.get(Uri.parse(baseUrl));

    if (responce.statusCode == 200) {
      Map<String,dynamic> jsonData = jsonDecode(responce.body);
      return (jsonData['forts'] as List).map((json) => FortModel.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
