import 'package:blogs_comments/core/usecase/usecase.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:blogs_comments/features/blog/domain/usecases/get_all_posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetAllPosts _getAllPosts;

  PostBloc({required GetAllPosts getAllPosts})
      : _getAllPosts = getAllPosts,
        super(PostInitial()) {
    on<PostEvent>((event, emit) => emit(PostLoading()));
    on<PostGetAllPosts>(_onGetAllPosts);
  }

  void _onGetAllPosts(PostGetAllPosts event, Emitter<PostState> emit) async {
    final res = await _getAllPosts(NoParams());
    res.fold(
      (l) => emit(
        PostFailure(l.message),
      ),
      (r) => emit(
        PostDisplaySuccess(r),
      ),
    );
  }
}
