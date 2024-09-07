import 'package:blogs_comments/core/utils/failures.dart';
import 'package:blogs_comments/core/usecase/usecase.dart';
import 'package:blogs_comments/features/blog/domain/entities/comments.dart';
import 'package:blogs_comments/features/blog/domain/repositories/post_repo.dart';
import 'package:fpdart/fpdart.dart';

class GetAllComments
    implements UseCase<List<CommentEntity>, GetAllCommentsParams> {
  final Repository commentRepository;
  GetAllComments(this.commentRepository);

  @override
  Future<Either<Failure, List<CommentEntity>>> call(
    GetAllCommentsParams params,
  ) async {
    return await commentRepository.getAllComments(postId: params.postId);
  }
}

class GetAllCommentsParams {
  final int postId;

  GetAllCommentsParams({required this.postId});
}
