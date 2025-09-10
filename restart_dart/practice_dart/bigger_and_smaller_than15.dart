void main() {
  final list = [10, 12, 15, 28, 11, 32, 5];

  final small = smalleerThan15(list);
  print('Smaller number than 15 : $small');

  final big = biggerThan15(list);
  print('Bigger number than 15 : $big');

  final div = dividedBy2(list);
  print('Numbers divided by 2 : $div');
}

List<int> smalleerThan15(List<int> list) {
  List<int> smaller = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i] < 15) {
      smaller.add(list[i]);
    }
  }
  return smaller;
}

List<int> biggerThan15(List<int> list) {
  List<int> bigger = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i] > 15) {
      bigger.add(list[i]);
    }
  }
  return bigger;
}

List<int> dividedBy2(List<int> list) {
  List<int> divided = [];
  for (int i = 0; i < list.length; i++) {
    if (list[i] % 2 == 0) {
      divided.add(list[i]);
    }
  }
  return divided;
}
