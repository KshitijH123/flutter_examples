void main() {
  List<String> items = ['apple', 'banana', 'apple', 'orange', 'banana'];

  print('Original: $items');

  List<String> unique = items.toSet().toList();

  print('Unique: $unique');
}
