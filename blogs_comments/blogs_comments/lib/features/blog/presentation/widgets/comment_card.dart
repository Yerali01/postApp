import 'package:blogs_comments/features/blog/domain/entities/comments.dart';
import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final CommentEntity comment;
  CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Text(
        "${comment.postId}",
      ),
    );
  }
}
