import 'package:blogs_comments/features/blog/domain/entities/comments.dart';
import 'package:blogs_comments/features/blog/domain/usecases/get_all_comments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetAllComments _getAllComments;

  CommentBloc({required GetAllComments getPostComments})
      : _getAllComments = getPostComments,
        super(CommentInitial()) {
    on<CommentEvent>(
      (event, emit) => emit(CommentLoading()),
    );
    on<CommentGetAllComments>(_onGetAllComments);
  }

  void _onGetAllComments(
      CommentGetAllComments event, Emitter<CommentState> emit) async {
    final res = await _getAllComments(
      GetAllCommentsParams(postId: event.postId),
    ); //post as a param

    res.fold(
      (l) => emit(
        CommentFailure(l.message),
      ),
      (r) => emit(
        CommentDisplaySuccess(r),
      ),
    );
  }
}
