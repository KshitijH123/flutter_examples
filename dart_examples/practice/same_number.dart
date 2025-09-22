void main() {
  final list1 = [1, 2, 3, 4, 5, 6, 57, 86, 8, 9, 0];
  final list2 = [6, 3, 7, 8, 23, 56, 9];

  final sameItemList = findSameItems(list1, list2);
  final differentItemList = findDifferentItems(list1, list2);

  print(sameItemList);
  print(differentItemList);
}

//Create function to take two lists and return list of simillar items;
List<int> findSameItems(List<int> list1, List<int> list2) {
  List<int> sameList = [];

  for (int i = 0; i < list1.length; i++) {
    // list1[2] = 3, list2[] = 3
    for (int j = 0; j < list2.length; j++) {
      if (list1[i] == list2[j]) {
        sameList.add(list1[i]);
      }
    }
  }

  return sameList;
}

List<int> findDifferentItems(List<int> list1, List<int> list2) {
  List<int> differentList = [];

  for (int i = 0; i < list1.length; i++) {
    if (!list2.contains(list1[i])) {
      differentList.add(list1[i]);
    }
  }

  for (int j = 0; j < list2.length; j++) {
    if (!list1.contains(list2[j])) {
      differentList.add(list2[j]);
    }
  }
  return differentList;
}
