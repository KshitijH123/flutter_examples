// Failed Students name


import 'student_model.dart';

void main() {
  final List<Student> students = [
    Student(name: 'kshitij', percentage: 35, isPassed: false),
    Student(name: 'rushi', percentage: 67, isPassed: true),
    Student(name: 'om', percentage: 30, isPassed: false),
    Student(name: 'yash', percentage: 65, isPassed: true),
    Student(name: 'harsh', percentage: 32, isPassed: false),
  ];

  final failedStudents = students
      .where((student) => !student.isPassed)
      .toList();

  final studentName = failedStudents.map((student) => student.name).toList();
  print(studentName);
}
