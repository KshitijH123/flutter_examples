void main() {
  List<int>? optionalNumbers; 

  List<int> finalList = [1, 2, ...?optionalNumbers, 99];

  print(finalList); 
}
