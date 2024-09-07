import 'package:blogs_comments/core/connection_checker.dart';
import 'package:blogs_comments/core/failures.dart';
import 'package:blogs_comments/features/blog/data/datasources/cache_datasource.dart';
import 'package:blogs_comments/features/blog/data/datasources/remote_datasource.dart';
import 'package:blogs_comments/features/blog/domain/entities/comments.dart';
import 'package:blogs_comments/features/blog/domain/entities/post.dart';
import 'package:blogs_comments/features/blog/domain/repositories/post_repo.dart';
import 'package:fpdart/fpdart.dart';

class RepositoryImplementation implements Repository {
  final RemoteDatasource remoteDatasource;
  final CacheDatasource cacheDatasource;
  final ConnectionChecker connectionChecker;

  RepositoryImplementation(
      this.remoteDatasource, this.cacheDatasource, this.connectionChecker);

  @override
  Future<Either<Failure, List<PostEntity>>> getAllPosts() async {
    try {
      if (!await connectionChecker.isConnected) {
        print("started from cache ");
        final posts = await cacheDatasource.getFromLocalPosts();
        return right(posts);
      }

      final posts = await remoteDatasource.getAllPosts();
      cacheDatasource.uploadToLocalPosts(posts: posts);
      return right(posts);
    } on Exception catch (e) {
      print(e.toString());
      return left(Failure('Error fetching posts'));
    }
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> getAllComments({
    required int postId,
  }) async {
    try {
      if (!await connectionChecker.isConnected) {
        final comments = await cacheDatasource.getFromLocalComments(postId);
        return right(comments);
      }

      final comments = await remoteDatasource.getAllComments(postId);
      cacheDatasource.uploadToLocalComments(postId: postId, comments: comments);
      return right(comments);
    } catch (e) {
      print(e.toString());
      return left(Failure('Error fetching comments'));
    }
  }
}
