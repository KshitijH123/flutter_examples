class StudentsModel {
  final int? id;
  final String name;
  final int marathiMarks;
  final int hindiMarks;
  final int englishMarks;
  final int scienceMarks;
  final int historyMarks;

  StudentsModel({
    this.id,
    required this.name,
    required this.marathiMarks,
    required this.hindiMarks,
    required this.englishMarks,
    required this.scienceMarks,
    required this.historyMarks,
  });

  int totalMarks() {
    return marathiMarks +
        hindiMarks +
        englishMarks +
        scienceMarks +
        historyMarks;
  }

  double percentage() {
    return (totalMarks() / 500) * 100;
  }

  String get result {
    if (marathiMarks < 35 ||
        hindiMarks < 35 ||
        englishMarks < 35 ||
        scienceMarks < 35 ||
        historyMarks < 35) {
      return 'Fail';
    }
    return 'Pass';
  }

  factory StudentsModel.fromJson(Map<String, dynamic> json) {
    return StudentsModel(
      id: json[StudentsModelKey.id],
      name: json[StudentsModelKey.name],
      marathiMarks: json[StudentsModelKey.marathiMarks],
      hindiMarks: json[StudentsModelKey.hindiMarks],
      englishMarks: json[StudentsModelKey.englishMarks],
      scienceMarks: json[StudentsModelKey.scienceMarks],
      historyMarks: json[StudentsModelKey.historyMarks],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      StudentsModelKey.id: id,
      StudentsModelKey.name: name,
      StudentsModelKey.marathiMarks: marathiMarks,
      StudentsModelKey.hindiMarks: hindiMarks,
      StudentsModelKey.englishMarks: englishMarks,
      StudentsModelKey.scienceMarks: scienceMarks,
      StudentsModelKey.historyMarks: historyMarks,
    };
  }
}

class StudentsModelKey {
  static const id = 'id';
  static const name = 'name';
  static const marathiMarks = 'marathiMarks';
  static const hindiMarks = 'hindiMarks';
  static const englishMarks = 'englishMarks';
  static const scienceMarks = 'scienceMarks';
  static const historyMarks = 'historyMarks';
}
