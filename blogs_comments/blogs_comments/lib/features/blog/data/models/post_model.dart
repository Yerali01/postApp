import 'package:blogs_comments/features/blog/domain/entities/post.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> map) {
    return PostModel(
      userId: map['userId'] ?? 0,
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }
}
