class RecepieModel {
  final int id;
  final String name;
  final List<String> ingredients;
  final String image;
  final List<String> instructions;
  final String cuisine;
  final double rating;
  final int reviewCount;
  final String difficulty;

  RecepieModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.image,
    required this.instructions,
    required this.cuisine,
    required this.rating,
    required this.reviewCount,
    required this.difficulty,
  });

  factory RecepieModel.fromJson(Map<String, dynamic> json) {
    return RecepieModel(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      image: json['image'],
      instructions: List<String>.from(json['instructions']),
      cuisine: json['cuisine'],
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'],
      difficulty: json['difficulty'],
    );
  }
}
