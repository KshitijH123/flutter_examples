// geneare list of 100 and print first item which divided by 7 and 5
// without using function

// void main() {
//   final list = List.generate(100, (index) => index + 1);

//   final number = list.firstWhere((item) => item % 7 == 0 && item % 5 == 0);

//   print(number);
// }

void main() {
  final list = List.generate(100, (index) => index + 1);
  int number = 0;

  for (int i = 0; i < list.length; i++) {
    if (list[i] % 5 == 0 && list[i] % 7 == 0) {
      number = list[i];
      break;
    }
  }
 print(number);
}
