void main() {
  final list = [10, 12, 15, 11, 25, 30, 35];

  final small = smallestNumber(list);
  print('smallest number is  : $small');

  final big = biggestNumber(list);
  print('biggest number is  : $big');
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
  int bigger = list[0];

  for (int e = 0; e < list.length; e++) {
    if (list[e] > bigger) {
      bigger = list[e];
    }
  }
  return bigger;
}
