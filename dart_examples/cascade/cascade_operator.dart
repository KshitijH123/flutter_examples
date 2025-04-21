class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void introduce() {
    print('Hello, my name is $name and I am $age years old.');
  }

  void haveBirthday() {
    age++;
    print('Happy Birthday! I am now $age years old.');
  }
}

void main() {
  var person = Person('Alice', 25);

  person
    ..introduce()
    ..haveBirthday()
    ..introduce();
}
