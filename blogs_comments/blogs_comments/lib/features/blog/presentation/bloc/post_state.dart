part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

final class PostFailure extends PostState {
  final String error;
  PostFailure(this.error);
}

final class PostDisplaySuccess extends PostState {
  final List<PostEntity> posts;

  PostDisplaySuccess(this.posts);
}
