import 'package:blogs_comments/core/theme/theme.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/comment_bloc.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/post_bloc.dart';
import 'package:blogs_comments/features/blog/presentation/pages/posts_page.dart';
import 'package:blogs_comments/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => serviceLocator<PostBloc>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<CommentBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostGetAllPosts());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechTask',
      theme: AppTheme.darkThemeMode,
      home: BlocSelector<PostBloc, PostState, bool>(
        selector: (state) {
          return state is PostDisplaySuccess;
        },
        builder: (context, state) {
          return const PostsPage();
        },
      ),
    );
  }
}
