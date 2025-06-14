void main(){

  List<int> numbers = [1, 2, 3, 4, 5];
  List<String> fruits = ['apple', 'banana', 'orange'];

  List<int> fixedList = List.filled(5, 0); 

  List<int> squares = List.generate(5, (index) => index * index);

  print('Numbers: $numbers');
  print('Fruits: $fruits');
  print('Fixed list: $fixedList');
  print('Squares: $squares\n');
}