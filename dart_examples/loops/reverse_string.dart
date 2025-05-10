void main() {
  List<String> strings = ['apple', 'banana', 'cherry', 'date'];

  for (int i = strings.length - 1; i >= 0; i--) {
    String reversedString = strings[i].split('').reversed.join('');
    print(reversedString);
  }
}

