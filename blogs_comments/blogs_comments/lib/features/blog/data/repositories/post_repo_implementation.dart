import 'package:blogs_comments/core/failures.dart';
import 'package:blogs_comments/features/blog/data/datasources/remote_datasource.dart';
import 'package:blogs_comments/features/blog/domain/entities/comments.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:blogs_comments/features/blog/domain/repositories/post_repo.dart';
import 'package:fpdart/fpdart.dart';

class RepositoryImplementation implements PostRepository {
  final RemoteDatasource postRemoteDatasource;

  RepositoryImplementation(this.postRemoteDatasource);

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    try {
      final posts = await postRemoteDatasource.getAllPosts();
      print(posts.length);
      return right(posts);
    } on Exception catch (e) {
      print(e.toString());
      return left(Failure('Error fetching posts'));
    }
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> getAllComments() async {
    try {
      final comments = await postRemoteDatasource.getAllComments();
      print(comments.length);
      return right(comments);
    } catch (e) {
      print(e.toString());
      return left(Failure('Error fetching comments'));
    }
  }
}
