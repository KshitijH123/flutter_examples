void main() {
  int number = 7;
  String result = checkEvenOdd(number);
  print('The number $number is $result.');
}

String checkEvenOdd(int number) {
  if (number % 2 == 0) {
    return 'Even';
  } else {
    return 'Odd';
  }
}
