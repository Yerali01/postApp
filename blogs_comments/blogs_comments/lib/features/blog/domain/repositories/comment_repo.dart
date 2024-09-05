import 'package:blogs_comments/core/failures.dart';

abstract interface class CommentRepository {
  Future<Either<Failure, List<CommentEntity>>> getAllComments();
}
