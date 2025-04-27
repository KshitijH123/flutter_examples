// late (Initialize Later)

// You promise Dart:
// "I'll set the value before using it."

// No need for ?, and no need for ! everywhere.

void main() {
  late String token;

  token = "abc123";
  print(token);
}

// If you use it before assigning, app crashes!

