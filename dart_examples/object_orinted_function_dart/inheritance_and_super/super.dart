// What is super in Dart?
// super refers to the parent class (superclass).

// You use super to:

// Call a parent class method or

// Access a parent class constructor.

class Animal {
  void eat() {
    print('Animal is Eating');
  }
}

class Dog extends Animal {
  void eat() {
    super.eat();
    print('Dog is eating to');
  }
}

void main() {
  Dog dog = Dog();
  dog.eat();
}
