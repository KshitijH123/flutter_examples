// Factory Constructors
// Factory constructors don't always create a new object.

// They can return existing objects or perform some logic before returning.

// Useful when:

// Controlling object creation (like Singleton pattern).

// Returning different subclasses.

class Person {
  String name;
  int age;

  Person._internal(this.name, this.age);

  factory Person(String name, int age) {
    if (age < 0) {
      age = 0;
    }
    return Person._internal(name, age);
  }
}

void main() {
  Person p = Person('Yash', 5);
  print('${p.name}, ${p.age}');
}


// Here, the factory constructor checks the age, and fixes it if invalid.