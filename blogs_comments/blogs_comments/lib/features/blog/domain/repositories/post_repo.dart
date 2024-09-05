import 'package:blogs_comments/core/failures.dart';
import 'package:blogs_comments/features/blog/domain/entities/comments.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getAllPosts();
}
