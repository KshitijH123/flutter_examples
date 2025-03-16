import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/loggedin_user_model.dart';
import '../model/user_list.dart';

class ApiSevice {
  ApiSevice._();
  static ApiSevice instance = ApiSevice._();

  static const String _loginUrl = 'https://dummyjson.com/user/login';

  Future<LogedInUser?> loginUser({
    required String username,
    required String password,
  }) async {
    final payload = {'username': username, 'password': password};

    final responce = await http.post(
      Uri.parse(_loginUrl),
      headers: {'Content-type': 'application/json'},
      body: json.encode(payload),
    );

    if (responce.statusCode == 200) {
      final logedInUser = LogedInUser.fromJson(json.decode(responce.body));
      return logedInUser;
    } else {
      return null;
    }
  }

  Future<List<User>> fetchUsers() async {
    final responce = await http.get(Uri.parse('https://dummyjson.com/users'));

    if (responce.statusCode == 200) {
      final data = jsonDecode(responce.body);
      return (data['users'] as List)
          .map((user) => User.fromJson(user))
          .toList();
    }

    return [];
  }
}
