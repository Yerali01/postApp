import 'package:blogs_comments/core/utils/failures.dart';
import 'package:blogs_comments/features/blog/domain/entities/comments.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class Repository {
  Future<Either<Failure, List<PostEntity>>> getAllPosts();

  Future<Either<Failure, List<CommentEntity>>> getAllComments({
    required int postId,
  });
}
