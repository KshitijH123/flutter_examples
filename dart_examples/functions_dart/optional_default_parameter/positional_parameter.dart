//  Optional Positional Parameters ([])
// You use square brackets [] to make parameters optional by position.

// You can also give default values.

void person(String name, [String country = 'India']) {
  print('Hello $name from $country');
}

void main() {
  person('yash');
  person('om', 'USA');
  person('harsh');
}
