import 'package:blogs_comments/core/failures.dart';
import 'package:blogs_comments/core/usecase/usecase.dart';
import 'package:blogs_comments/features/blog/domain/entities/comments.dart';
import 'package:blogs_comments/features/blog/domain/repositories/post_repo.dart';
import 'package:fpdart/src/either.dart';

class GetAllComments implements UseCase<List<CommentEntity>, NoParams> {
  final PostRepository commentRepository;
  GetAllComments(this.commentRepository);

  @override
  Future<Either<Failure, List<CommentEntity>>> call(NoParams params) async {
    return await commentRepository.getAllComments();
  }
}
