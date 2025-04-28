// Mixin
// A mixin is like a reusable set of methods and properties.

// You reuse code across multiple classes without extending.

// Mixin cannot have constructors.

// You use with keyword to apply a mixin.

class Student with Name ,Age {
  void roll(){}
}

class Teacher with Name, Age{
  void subject(){}
}

mixin Name{
  void name(){}
}

mixin Age{
 void age() {}
}
