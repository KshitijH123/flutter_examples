// Named Constructors
// Dart allows multiple constructors for a class by giving them names.

// Useful for creating objects in different ways.

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  Person.young(this.name) : age = 18;
}

void main() {
  Person p1 = Person('Bob', 30);
  Person p2 = Person.young('Charlie');

  print('${p1.name}, ${p1.age}');
  print('${p2.name}, ${p2.age}');
}
