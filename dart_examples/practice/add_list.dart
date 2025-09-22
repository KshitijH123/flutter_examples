void main() {
  List<int> listNumbers = [1, 2, 3, 4, 5, 6];
  listNumbers.add(7);

  var names = [];
  names.add('ganesh');
  names.add('suyash');
  names.add('sursh');
  names.add('mahesh');
  names.add('mangesh');
  names.add('nagesh');

  names[2] = 'suresh';
  listNumbers.replaceRange(0, 5, [6, 5, 4, 3, 2, 1]);
  listNumbers.removeLast();
  listNumbers.remove(6);
  listNumbers.removeAt(2);
  listNumbers.removeRange(0, 3);
  // names.addAll(listNames);

  names.insert(2, 13);
  names.insertAll(4, listNumbers);
  print(names);
  print("Lenght : ${listNumbers.length}");
}
