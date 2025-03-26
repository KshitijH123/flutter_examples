class User {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String gender;
  final String birthDate;
  final String password;
  final String image;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.birthDate,
    required this.password,
    required this.image,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      gender: json['gender'],
      birthDate: json['birthDate'],
      password: json['password'],
      image: json['image'],
    );
  }
}
