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
    }
     return [];

  }

  Future<bool> deleteStudent(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/students/$id'));

      if (response.statusCode == 200) {
        print('Student deleted successfully.');
        return true;
      } else {
        print('Failed to delete student. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
    }
    return false;

  }

  Future<StudentsModel?> addStudent(StudentsModel student) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/add-student'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(student.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print('Student added successfully.');
        return StudentsModel.fromJson(jsonResponse);
      } else {
        print('Failed to add student. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
    }
     return null;
    
  }
}
