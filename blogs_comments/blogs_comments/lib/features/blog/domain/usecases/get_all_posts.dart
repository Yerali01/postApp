import 'package:blogs_comments/core/utils/failures.dart';
import 'package:blogs_comments/core/usecase/usecase.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:blogs_comments/features/blog/domain/repositories/post_repo.dart';
import 'package:fpdart/fpdart.dart';

class GetAllPosts implements UseCase<List<PostEntity>, NoParams> {
  final Repository postRepository;
  GetAllPosts(this.postRepository);

  @override
  Future<Either<Failure, List<PostEntity>>> call(NoParams params) async {
    return await postRepository.getAllPosts();
  }
}
