void main() {
  final recipe1 = Recipe(name: 'Vadapav', source: 'Mumbai');
  Recipe.contry = 'india';
  final recipe2 = Recipe(name: 'Misal Pav', source: 'Kolhapur');

  recipe1.cook();
  recipe2.cook();


  print(Recipe.contry);
}

class Recipe {
  final String name;
  final String source;
  static String? contry;

  Recipe({required this.name, required this.source});

  void cook() {}

  static throwDish() {}
}
