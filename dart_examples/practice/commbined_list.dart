void main() {
  List<int> list1 = [1, 2, 3, 4];
  List<int> list2 = [5, 6, 7, 8, 9];

  // List<int> combinedList = [];

  // for (int i = 0; i < list1.length; i++) {
  //   combinedList.add(list1[i]);
  // }

  // for (int j = 0; j < list2.length; j++) {
  //   combinedList.add(list2[j]);
  // }

  // print(combinedList);

  // spread operator

  List<int> combinedList = [...list1, ...list2];

  print(combinedList);
}
