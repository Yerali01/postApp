import 'package:blogs_comments/features/blog/domain/entities/post.dart';

class PostModel extends PostEntity {
  PostModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
    super.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
      'imageUrl': imageUrl,
    };
  }

  factory PostModel.fromJson(Map<dynamic, dynamic> map) {
    return PostModel(
      userId: map['userId'] ?? 0,
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  PostModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
    String? imageUrl,
  }) {
    return PostModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
