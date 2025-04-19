void main() {
  String name = "Alice";
  print("Non-nullable name: $name");

  String? nickname = null;
  print("Nullable nickname: ${nickname ?? "No nickname"}");

  late int age;
  age = 25;
  print("Late initialized age: $age");

  String? city;
  String displayCity = city ?? "Unknown City";
  print("City: $displayCity");

  int? score;
  score ??= 0;
  print("Score: $score");

  String? bio = "Hello there!";
  int? bioLength = bio.length; 
  print("Bio length: $bioLength");

  String? country = "India";
  print("Country length: ${country.length}");

  List<String>? items = ["A", "B"];
  items.add("C"); 
  print("Items: $items");

  List<String>? fruits = ["Apple", "Banana"];
  String? firstFruit = fruits[0]; 
  print("First fruit: $firstFruit");

  List<String>? optionalTools = ["Pen", "Notebook"];
  List<String> backpack = ["Laptop", ...optionalTools];
  print("Backpack: $backpack");

  Map<String, String>? user = {"id": "001", "name": "Bob"};
  String? userId = user["id"];
  print("User ID: $userId");
}
