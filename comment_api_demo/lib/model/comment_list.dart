class CommentList {
  final List<Comment> comments;
  final int total;
  final int skip;
  final int limit;

  CommentList({
    required this.comments,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CommentList.fromJson(Map<String, dynamic> json) {
    return CommentList(
      comments: List<Comment>.from(
        json['comments'].map((x) => Comment.fromJson(x)),
      ),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}

class Comment {
  final int id;
  final String body;
  final int postId;
  final User user;

  Comment({
    required this.id,
    required this.body,
    required this.postId,
    required this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      body: json['body'],
      postId: json['postId'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  final int id;
  final String username;

  User({required this.id, required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], username: json['username']);
  }
}
