class StudentsModel {
  final int id;
  final String name;
  final int marathiMarks;
  final int hindiMarks;
  final int englishMarks;
  final int scienceMarks;
  final int historyMarks;

  StudentsModel({
    required this.id,
    required this.name,
    required this.marathiMarks,
    required this.hindiMarks,
    required this.englishMarks,
    required this.scienceMarks,
    required this.historyMarks,
  });
  // factory StudentsModel.fromJson(Map<String, dynamic> json) {
  //   return StudentsModel(
  //     id: json['id'],
  //     name: json['name'],
  //     marathiMarks: json['marathiMarks'],
  //     hindiMarks: json['hindiMarks'],
  //     englishMarks: json['englishMarks'],
  //     scienceMarks: json['englishMarks'],
  //     historyMarks: json['historyMarks'],
  //   );
  // }
}
