import 'package:blogs_comments/core/theme/app_pallete.dart';
import 'package:blogs_comments/core/utils/show_snackbar.dart';
import 'package:blogs_comments/core/widgets/shimmer_comment_loader.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/comment_bloc.dart';
import 'package:blogs_comments/features/blog/presentation/widgets/comment_card.dart';
import 'package:blogs_comments/features/blog/presentation/widgets/post_details_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailsPage extends StatefulWidget {
  static route(PostEntity post) => MaterialPageRoute(
        builder: (context) => PostDetailsPage(post: post),
      );

  final PostEntity post;
  const PostDetailsPage({
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
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool a) {
          return [
            SliverAppBar(
              title: Text(
                widget.post.title,
                style: const TextStyle(
                  color: AppPallete.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              pinned: false,
              floating: true,
              centerTitle: true,
              elevation: 0,
              stretch: true,
            ),
            SliverToBoxAdapter(
              child: PostDetailsContainer(post: widget.post),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                  .copyWith(top: 15),
              sliver: const SliverToBoxAdapter(
                child: Text(
                  "Comments",
                  style: TextStyle(
                    color: AppPallete.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ];
        },
        body: BlocConsumer<CommentBloc, CommentState>(
          listener: (context, state) {
            if (state is CommentFailure) {
              showSnackbar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is CommentLoading) {
              return const ShimmerCommentLoader();
            }
            if (state is CommentDisplaySuccess) {
              if (state.comments.isEmpty) {
                return const Center(
                  child: Text('No comments found.'),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: state.comments.length,
                itemBuilder: (context, index) {
                  final comment = state.comments[index];
                  return Container(
                    child: CommentCard(comment: comment),
                  );
                },
              );
            }
            return const Center(
              child: Text('No comments found.'),
            );
          },
        ),
      ),
    );
  }
}
