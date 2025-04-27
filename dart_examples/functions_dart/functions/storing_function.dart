void main() {
  int Function(int, int) operations = multiply;
  print(operations(3, 5));
}

int multiply(int x, int y) => x * y;
