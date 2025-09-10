class UserModel {
  String? name;
  int? mobileNumber;
  DateTime? dateOfBirth;
  String? email;
  String? password;

  UserModel({
    this.name,
    this.mobileNumber,
    this.dateOfBirth,
    this.email,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      mobileNumber: json['mobileNumber'],
      dateOfBirth:
          json['dateOfBirth'] != null
              ? DateTime.parse(json['dateOfBirth'])
              : null,
      email: json['email'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'mobileNumber': mobileNumber,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'email': email,
      'password': password,
    };
  }
}
