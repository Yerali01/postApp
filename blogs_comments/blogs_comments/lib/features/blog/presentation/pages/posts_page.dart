import 'package:blogs_comments/core/theme/app_pallete.dart';
import 'package:blogs_comments/core/utils/show_snackbar.dart';
import 'package:blogs_comments/core/widgets/shimmer_post_loader.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/post_bloc.dart';
import 'package:blogs_comments/features/blog/presentation/widgets/post_card.dart';
import 'package:flutter/material.dart';
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
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool a) {
          return [
            const SliverAppBar(
              title: Text(
                "Posts",
                style: TextStyle(
                  color: AppPallete.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
              ),
              pinned: false,
              floating: true,
              centerTitle: true,
              elevation: 0,
              stretch: true,
            ),
          ];
        },
        body: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostFailure) {
              showSnackbar(context, state.error);
            }
          },
          builder: (context, state) {
            if (state is PostLoading) {
              return const ShimmerPostLoader();
            }
            if (state is PostDisplaySuccess) {
              return StreamBuilder<List<PostEntity>>(
                stream: state.subject.stream,
                builder: (context, AsyncSnapshot<List<PostEntity>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 20),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final post = snapshot.data![index];
                        return PostCard(
                          post: post,
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Container();
                  } else {
                    return Container();
                  }
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
