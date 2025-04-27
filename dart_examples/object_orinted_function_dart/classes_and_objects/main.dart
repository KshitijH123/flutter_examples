// ► What is a Class?

// A class is like a blueprint.
// It defines how an object will look and behave (its properties and methods).
// class is collection of member function and member variable.

//► What is an Object?

// An object is a real thing created from a class.
// If Car is the blueprint, then your red Honda is an object (instance) of the Car class.


class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void sayHello() {
    print('Hello, my name is $name and I am $age years old.');
  }
}

void main() {
  Person person1 = Person('Bob', 30);

  person1.sayHello();
}
