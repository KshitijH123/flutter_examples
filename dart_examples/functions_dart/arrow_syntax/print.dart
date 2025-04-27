// Key Points:
// Only for single expressions (not for multiple lines).

// Automatically returns the value (for non-void functions).

// Makes code short and clean.

void main() {
  void hello(String name) => print('hello $name');
  hello('Kshitij');

  int add(int a, int b) => a + b;
  print(add(5, 9));
}
