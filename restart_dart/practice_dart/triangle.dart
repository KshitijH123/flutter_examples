void main() {
  int rows = 5;

  for (int i = 1; i <= rows; i++) {
    print(' ' * (rows - i) + '*' * (2 * i - 1));
  }
}
