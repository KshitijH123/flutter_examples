// ➔ What are Getters and Setters?
// Getter → Used to get (retrieve) the value of a private variable.

// Setter → Used to set (update) the value of a private variable.

// In Dart, they are defined using get and set keywords.


void main() {
  var obj = A();

  obj.x = 10; // Default Setter

  print(obj.x); // Default Getter 
}

class A {
  var x;
}


// ➔ Important Points:
// Private variables in Dart are declared by prefixing the name with _ (underscore).

// Getter does not use parentheses when called (it looks like a property).

// Setter behaves like assigning to a variable.

// You can add logic inside getters and setters if needed (like validation).

