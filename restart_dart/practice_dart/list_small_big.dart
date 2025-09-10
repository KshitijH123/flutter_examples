void main() {
  final list = [10, 12, 15, 28, 11, 32, 5];

  final small = smallestNumber(list);
  print('smallestNumber = $small');

  final big = biggestNumber(list);
  print('biggestnumber = $big');

  final div = dividedby2(list);
  print('Divided by 2 : $div');
}

int smallestNumber(List<int> list) {
  int minimum = list[0];
  for (int i = 0; i < list.length; i++) {
    if (list[i] < minimum) {
      minimum = list[i];
    }
  }
  return minimum;
}

int biggestNumber(List<int> list) {
  int biggest = list[0];
  for (int a = 0; a < list.length; a++) {
    if (list[a] > biggest) {
      biggest = list[a];
    }
  }
  return biggest;
}

int dividedby2(List<int> list) {
  int divided = list[0];
  for (int i = 0; i < list.length; i++) {
    if (list[i] % 2 == 0) {
      divided = list[i];
    }
  }
  return divided;
}
