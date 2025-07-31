class FortModel {
  final int id;
  final String name;
  final String location;
  final int distance;
  final List<String> images;

  FortModel({
    required this.id,
    required this.name,
    required this.location,
    required this.distance,
    required this.images,
  });
  
  factory FortModel.fromJson(Map<String, dynamic> json) {
    return FortModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      distance: json['distance_from_pune_km'],
      images: (json['images'] as List).map((item) => item as String).toList(),
    );
  }
}
