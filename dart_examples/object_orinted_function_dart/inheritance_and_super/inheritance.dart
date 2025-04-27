// What is Inheritance in Dart?
// Inheritance means one class (child) gets properties and behaviors (fields and methods) from another class (parent).

// It helps to reuse code and build relationships between classes.

// In Dart, you use the extends keyword for inheritance.

class Animal {
  void eat() {
    print('Animal is eating');
  }
}

class Dog extends Animal {
  void bark() {
    print('Dog is barking');
  }
}

void main() {
  Dog dog = Dog();
  dog.eat();
  dog.bark();
}

// Here, Dog inherits the eat() method from Animal.

