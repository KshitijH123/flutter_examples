void main(){
   List<int> original = [1, 2, 3, 4, 5, 6];

  List<int> double = original.map((x) => x * 2).toList();
  List<String> strings = original.map((x) => 'Number: $x').toList();

  print('Original: $original');
  print('Doubled: $double');
  print('As strings: $strings');
}