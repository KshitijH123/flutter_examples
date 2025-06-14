class User {
  final int id;
  final String username;
  final String email;
  final String phonenumber; 
  final int password; 
  final String address;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.phonenumber,
    required this.password,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'].toString(),
      email: json['email'].toString(),
      phonenumber: json['phone_number'], 
      password: json['password'], 
      address: json['address'],
    );
  }
}
