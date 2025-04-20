void main() {
  List<String>? fruits; 
  List<String> allFruits = ['Apple', ...?fruits, 'Banana'];

  print(allFruits); 
}
