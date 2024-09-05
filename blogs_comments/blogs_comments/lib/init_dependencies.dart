import 'package:blogs_comments/features/blog/data/datasources/remote_datasource.dart';
import 'package:blogs_comments/features/blog/data/repositories/post_repo_implementation.dart';
import 'package:blogs_comments/features/blog/domain/repositories/post_repo.dart';
import 'package:blogs_comments/features/blog/domain/usecases/get_all_posts.dart';
import 'package:blogs_comments/features/blog/presentation/bloc/post_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initPost();

  // Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;

  // serviceLocator.registerLazySingleton(() => Hive.box("posts"));
}

void _initPost() {
  //datasource
  serviceLocator
    ..registerFactory<RemoteDatasource>(
      () => RemoteDataSourceImpl(
          // serviceLocator(),
          ),
    )
    // ..registerFactory<BlogLocalDatasource>(
    //   () => BlogLocalDatasourceImplementation(
    //     serviceLocator(),
    //   ),
    // )
    //repository
    ..registerFactory<PostRepository>(
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
