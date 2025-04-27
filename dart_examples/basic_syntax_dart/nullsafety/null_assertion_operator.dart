//  ! (Null Assertion Operator)

// Tells Dart:
// "Trust me, this is NOT null."

// If it’s actually null, your app will CRASH! ⚠️

String? email;

void main() {

  email = "kshitij@gmail.com";
  print(email!);
}

// Use ! only if you are 100% sure the variable is not null.
