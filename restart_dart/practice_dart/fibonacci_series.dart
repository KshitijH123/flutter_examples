void main() {
  int a = 10;

  print('Fibonacci Series:');

  int first = 1;
  int second = 2;

  for (int i = 1; i <= a; i++) {
    print(first);

    int next = first + second;
    first = second;
    second = next;
  }
}
