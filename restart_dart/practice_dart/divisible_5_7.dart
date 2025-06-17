import 'dart:io';

void main() {
  print("please enter a number: ");
  int number = int.parse(stdin.readLineSync()!);

  if (number % 5 == 0 && number % 7 == 0) {
    print("$number is divisible by both 5 and 7.");
  } else {
    print("$number is not divisible by both 5 and 7.");
  }
}
