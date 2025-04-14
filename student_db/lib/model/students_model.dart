class StudentsModel {
  int? id;
  String name;
  int marathiMarks;
  int hindiMarks;
  int englishMarks;
  int scienceMarks;
  int historyMarks;
  String result;

  StudentsModel({
    this.id,
    required this.name,
    required this.marathiMarks,
    required this.hindiMarks,
    required this.englishMarks,
    required this.scienceMarks,
    required this.historyMarks,
    required this.result,
  });

  int totalMarks() {
    return marathiMarks +
        hindiMarks +
        englishMarks +
        scienceMarks +
        historyMarks;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'marathiMarks': marathiMarks,
      'hindiMarks': hindiMarks,
      'englishMarks': englishMarks,
      'scienceMarks': scienceMarks,
      'historyMarks': historyMarks,
      'result': result,
    };
  }

  factory StudentsModel.fromMap(Map<String, dynamic> map) {
    return StudentsModel(
      id: map['id'],
      name: map['name'],
      marathiMarks: map['marathiMarks'],
      hindiMarks: map['hindiMarks'],
      englishMarks: map['englishMarks'],
      scienceMarks: map['scienceMarks'],
      historyMarks: map['historyMarks'],
      result: map['result'],
    );
  }
}
