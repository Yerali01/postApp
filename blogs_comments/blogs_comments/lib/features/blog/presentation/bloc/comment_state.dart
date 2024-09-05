part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

final class CommentFailure extends CommentState {
  final String error;

  CommentFailure(this.error);
}

final class CommentDisplaySuccess extends CommentState {
  final List<CommentEntity> comments;
  CommentDisplaySuccess(this.comments);
}
