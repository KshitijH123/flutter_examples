import 'dart:io';

void main() {
  List<int> number = [];

  print('Enter 10 numbers');

  for (int i = 0; i < 10; i++) {
    stdout.write('Enter number: ${i + 1}:');
    int num = int.parse(stdin.readLineSync()!);
    number.add(num);
  }

  int greatest = number[0];
  for (int i = 1; i < number.length; i++) {
    if (number[i] > greatest) {
      greatest = number[i];
    }
  }
  print('The biggest number is: $greatest');
}
