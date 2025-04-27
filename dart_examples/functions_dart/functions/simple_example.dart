// What are Function Types?
// In Dart, functions are also "objects", and they have types — just like int, String, etc.

// You can:

// Store functions inside variables.

// Pass functions as arguments.

// Return functions from other functions.

// 👉 Function type = return type + parameter types.

void main() {
  int result = add(3, 5);
  print(result);
}

int add(int a, int b) {
  return a + b;
}
