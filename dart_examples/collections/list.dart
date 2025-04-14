
void main() {
  final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final evenList = numbers.firstWhere((num) => num % 7 == 0);
  print(evenList);
}

void clearList() {}
