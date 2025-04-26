// Sort students by percentage

import 'student_model.dart';

void main() {
  final List<Student> students = [
    Student(name: 'om', percentage: 65, isPassed: true),
    Student(name: 'yash', percentage: 75, isPassed: true),
    Student(name: 'rushi', percentage: 55, isPassed: true),
    Student(name: 'manan', percentage: 78, isPassed: true),
    Student(name: 'kshitij', percentage: 70, isPassed: true),
  ];

  students.sort((a, b) => b.percentage.compareTo(a.percentage));

  print('Sorted List:-');
  for (var student in students) {   
    // Flexible variable. Dart decides the type automatically.
    // You can change its value later.

    print('${student.name} - ${student.percentage}% ');
  }
}
