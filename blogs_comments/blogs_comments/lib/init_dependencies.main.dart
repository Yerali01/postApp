part of 'init_dependencies.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initPost();

  Hive.init((await getApplicationDocumentsDirectory()).path);

  serviceLocator.registerLazySingleton(() => Hive.box('blogs'));

  serviceLocator.registerFactory(() => InternetConnection());

  serviceLocator.registerFactory<ConnectionChecker>(
    () => ConnectionCheckerImplementation(
      serviceLocator(),
    ),
  );
}

void _initPost() {
  // all datasources
  serviceLocator
    ..registerFactory<RemoteDatasource>(
      () => RemoteDataSourceImplementation(),
    )
    ..registerFactory<CacheDatasource>(
      () => CacheDatasourceImplementation(),
    )
    // all repository
    ..registerFactory<Repository>(
      () => RepositoryImplementation(
        serviceLocator(),
        serviceLocator(),
        serviceLocator(),
      ),
    )
    // all usecases
    ..registerFactory(
      () => GetAllPosts(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetAllComments(
        serviceLocator(),
      ),
    )
    // all blocs
    ..registerLazySingleton(
      () => PostBloc(
        getAllPosts: serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => CommentBloc(
        getPostComments: serviceLocator(),
      ),
    );
}
