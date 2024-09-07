import 'package:blogs_comments/features/blog/domain/entities/comments.dart';

class CommentModel extends CommentEntity {
  CommentModel({
    required super.postId,
    required super.id,
    required super.name,
    required super.email,
    required super.body,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory CommentModel.fromJson(Map<dynamic, dynamic> map) {
    return CommentModel(
      postId: map['postId'] ?? 0,
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      body: map['body'] ?? '',
    );
  }
}
