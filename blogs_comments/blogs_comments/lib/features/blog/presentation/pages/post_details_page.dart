import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDetailsPage extends StatefulWidget {
  static route(PostEntity post) => MaterialPageRoute(
        builder: (context) => PostDetailsPage(post: post),
      );
  final PostEntity post;
  PostDetailsPage({super.key, required this.post});

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
