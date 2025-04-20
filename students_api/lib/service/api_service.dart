import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:students_api/model/student_model.dart';

class StudentService {
  final String baseUrl = 'https://student-records-1ukt.onrender.com';

  Future<List<StudentsModel>> fetchStudents() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/students'));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => StudentsModel.fromJson(json)).toList();
      } else {
        print('Failed to load students. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching students: $e');
      return [];
    }
  }
}
