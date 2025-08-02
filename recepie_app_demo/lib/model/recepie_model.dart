
class RecepieModel {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final String difficulty;
  final String cuisine;
  final String image;
  final double rating;
  final int reviewCount;

  RecepieModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.difficulty,
    required this.cuisine,
    required this.image,
    required this.rating,
    required this.reviewCount,
  });
  factory RecepieModel.fromJson(Map<String, dynamic> json) {
    return RecepieModel(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      image:json['image'],
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviewCount'],
    );
  }
}
