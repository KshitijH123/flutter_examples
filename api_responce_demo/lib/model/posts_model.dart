class Post {
  final int userId;
  final int? id; 
  final String title;
  final String body;

  Post({
    required this.userId,
    this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      if (id != null) 'id': id, 
      'title': title,
      'body': body,
    };
  }
}
