// It adds all elements of a list (or set, map) into another list.

// Helps build dynamic lists concisely.

// Avoids manually looping through a list to add items.

// Makes Flutter UIs cleaner when adding widgets conditionally or from another list.

void main() {
  List<int> a = [1, 2, 3];
  List<int> b = [0, ...a, 4]; 

  print(b); 
}




