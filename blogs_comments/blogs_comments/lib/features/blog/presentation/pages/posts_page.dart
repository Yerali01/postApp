import 'package:blogs_comments/core/utils/show_snackbar.dart';
import 'package:blogs_comments/core/widgets/shimmer_loader.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/post_bloc.dart';
import 'package:blogs_comments/features/blog/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const PostsPage(),
      );
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostGetAllPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        actions: [
          // IconButton(
          // icon: const Icon(Icons.add_circle_outline),
          // onPressed: () => Navigator.push(
          // context,
          // AddNewPostPage.route(),
          // ),
          // ),
        ],
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostFailure) {
            showSnackbar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is PostLoading) {
            print("Loader loading");
            return const ShimmerLoader();
          }
          if (state is PostDisplaySuccess) {
            print("listview success");
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return PostCard(
                  post: post,
                );
              },
            );
          }
          print('sized box');
          return const SizedBox();
        },
      ),
    );
  }
}
