// geneare list of 10 and print last 5 items.

void main() {
  final list = List.generate(10, (index) => index);
  final length = list.length;

  for (int i = length - 5; i < length; i++) {
    print(i);
  }
}
