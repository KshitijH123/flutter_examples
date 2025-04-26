void main() {
  final list = ['1', '2', '3', '4', '5'];

  final squares =
      list.map((item) {
        final num = int.parse(item);
        return num * num;
      }).toList();

  // final square = list.map((item) => num).toList();

  print(squares);
}

// length
// first, firstOrNull
// last, lastOrNull

// add(), addAll()
// remove(), removeAt()
// clear()
// forEach()
// map()
// firstWhere(), where(),
// final list = List.generate(100, (index) => index);

// squares
// geneare list of 10 and print last 5 items
// geneare list of 100 and print first item which divided by 7 and 5
// geneare list of 100 and print items divisible by 4
// geneare list of 10 and print there squares
