// geneare list of 100 and print items divisible by 4
// write without where fuctions

// void main() {
//   final list = List.generate(100, (index) => index + 1);

//   final number = list.where((item) => item % 4 == 0);

//   print(number);
// }

void main() {
  final list = List.generate(100, (index) => index + 1);
  final numbers = [];

  for (int i = 0; i < list.length; i++) {
    if (list[i] % 4 == 0) {
      numbers.add(list[i]);
    }
  }
   
  print(numbers);
}
