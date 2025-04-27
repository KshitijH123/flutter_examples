// You can initialize values directly when creating the object:

class Animal {
  String name;

  Animal(this.name);
}

void main() {
  Animal a = Animal('Dog');
  print(a.name);
}

//  this.name means "assign the incoming value to the class's name".
