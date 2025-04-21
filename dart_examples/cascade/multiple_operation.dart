void main() {
  var numbers =
      <int>[]
        ..add(1)
        ..add(2)
        ..add(3)
        ..addAll([4, 5, 6])
        ..remove(2);

  print(numbers);
}
