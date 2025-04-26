// Passed Students name

import 'student_model.dart';

void main() {
  final List<Student> students = [
    Student(name: 'om', percentage: 88, isPassed: true),
    Student(name: 'yash', percentage: 34, isPassed: false),
    Student(name: 'kshitij', percentage: 60, isPassed: true),
    Student(name: 'rushi', percentage: 30, isPassed: false),
    Student(name: 'manan', percentage: 70, isPassed: true),
  ];

  final passedStudents = students.where((student) => student.isPassed).toList();

  final studentsname = passedStudents.map((student) => student.name).toList();

  print(studentsname);
}
