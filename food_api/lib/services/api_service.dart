import 'dart:convert';
import 'package:food_api/model/model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices._();
  static final ApiServices instance = ApiServices._();

  final registerUrl = "http://192.168.29.142:2525/api/register";
    final userDetails = "http://192.168.29.142:2525/api/user";

  Future<User?> registerUser({
    required String username,
    required String email,
    required String phonenumber,
    required String password,
    required String address,
  }) async {
    
  }

  


}
