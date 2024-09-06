part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

final class CommentGetAllComments extends CommentEvent {
  final int postId;

  CommentGetAllComments({required this.postId});
}
