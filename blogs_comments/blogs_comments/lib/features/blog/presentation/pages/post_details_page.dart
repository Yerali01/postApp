import 'package:blogs_comments/core/utils/show_snackbar.dart';
import 'package:blogs_comments/core/widgets/shimmer_loader.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/comment_bloc.dart';
import 'package:blogs_comments/features/blog/presentation/widgets/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailsPage extends StatefulWidget {
  static route(PostEntity post) => MaterialPageRoute(
        builder: (context) => PostDetailsPage(post: post),
      );

  final PostEntity post;
  PostDetailsPage({
    super.key,
    required this.post,
  });

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  @override
  void initState() {
    super.initState();
    context
        .read<CommentBloc>()
        .add(CommentGetAllComments(postId: widget.post.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.post.title}"),
      ),
      body: BlocConsumer<CommentBloc, CommentState>(
        listener: (context, state) {
          if (state is CommentFailure) {
            showSnackbar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is CommentLoading) {
            return const ShimmerLoader();
          }
          if (state is CommentDisplaySuccess) {
            return ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                final comment = state.comments[index];
                return CommentCard(comment: comment);
              },
            );
          }

          return const Center(
            child: Text('No comments found.'),
          );
        },
      ),
    );
  }
}
