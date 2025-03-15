void main() {
  List<int> numbers = [1, 2, 3, 4];

  var squares = numbers.map((num) => num * num);
  print(squares.toList()); 
}
