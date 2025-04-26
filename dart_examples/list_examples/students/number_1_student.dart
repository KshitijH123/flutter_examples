import 'student_model.dart';

void main() {
  final List<Student> students = [
    Student(name: 'yash', percentage: 88, isPassed: true),
    Student(name: 'om', percentage: 82, isPassed: true),
    Student(name: 'harsh', percentage: 32, isPassed: false),
    Student(name: 'ashish', percentage: 78, isPassed: true),
    Student(name: 'kshitij', percentage: 65, isPassed: false),
  ];

  final topper = students.reduce(
    (student, next) => student.percentage > next.percentage ? student : next,
  );


  print('Topper of the class: ${topper.name}');
}
