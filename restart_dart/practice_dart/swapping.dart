void main() {
  int a = 10;
  int b = 20;

  print('Before swap: a = $a, b = $b');

  int temp = a;
  a = b;
  b = temp;

  print('After swap: a = $a, b = $b');
}
