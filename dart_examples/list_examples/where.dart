void main() {
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

  List<int> filteredList = list.where((item) => item.isEven).toList();

  print(filteredList);
}
