class Student {
  String name;
  int marks;

  Student(this.name, this.marks);

  @override
  String toString() {
    return 'Student: $name, Marks: $marks';
  }
}

void main() {
  List<Student> students = [
    Student('Alice Johnson', 92),
    Student('Bob Smith', 87),
    Student('Charlie Brown', 95),
    Student('Diana Prince', 89),
    Student('Edward Wilson', 91),
  ];

  Student topper = students[0];
  for (Student student in students) {
    if (student.marks > topper.marks) {
      topper = student;
    }
  }

  print('TOPPER STUDENT:');
  print('Name: ${topper.name}');
  print('Marks: ${topper.marks}');
}
