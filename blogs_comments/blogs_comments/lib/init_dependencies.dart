import 'package:blogs_comments/features/blog/data/datasources/remote_datasource.dart';
import 'package:blogs_comments/features/blog/data/repositories/repository_implementation.dart';
import 'package:blogs_comments/features/blog/domain/repositories/post_repo.dart';
import 'package:blogs_comments/features/blog/domain/usecases/get_all_comments.dart';
import 'package:blogs_comments/features/blog/domain/usecases/get_all_posts.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/comment_bloc.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/post_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initPost();
  _initComments();
}

void _initPost() {
  //datasource
  serviceLocator
    ..registerFactory<RemoteDatasource>(
      () => RemoteDataSourceImplementation(
          // serviceLocator(),
          ),
    )
    //repository
    ..registerFactory<Repository>(
      () => RepositoryImplementation(
        serviceLocator(),
      ),
    )
    //usecases
    ..registerFactory(
      () => GetAllPosts(
        serviceLocator(),
      ),
    )
    //bloc
    ..registerLazySingleton(
      () => PostBloc(
        getAllPosts: serviceLocator(),
      ),
    );
}

void _initComments() {
  //datasource
  serviceLocator
    ..registerFactory<RemoteDatasource>(
      () => RemoteDataSourceImplementation(
          // serviceLocator(),
          ),
    )
    //repository
    ..registerFactory<Repository>(
      () => RepositoryImplementation(
        serviceLocator(),
      ),
    )
    //usecases
    ..registerFactory(
      () => GetAllComments(
        serviceLocator(),
      ),
    )
    //bloc
    ..registerLazySingleton(
      () => CommentBloc(
        getPostComments: serviceLocator(),
      ),
    );
}
