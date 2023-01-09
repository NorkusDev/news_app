import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/src/domain/usecases/bookmarks/remove_bookmark_case.dart';

import 'core/core.dart';
import 'data/datasources/bookmarks/bookmarks_local_data_source.dart';
import 'data/datasources/news/news_local_data_source.dart';
import 'data/datasources/news/news_remote_data_source.dart';
import 'data/repositories/bookmark_repository_impl.dart';
import 'data/repositories/news_repository_impl.dart';
import 'domain/abstraction/bookmark_repository.dart';
import 'domain/domain.dart';
import 'presentation/bookmark/bloc/injection_explore_bloc.dart';
import 'presentation/explore/bloc/injection_explore_bloc.dart';
import 'presentation/home/bloc/injection_home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Bloc

  HomeBlocInjection.init(sl: sl);
  ExploreBlocInjection.init(sl: sl);
  BookmarkBlocInjection.init(sl: sl);

  //! Domain

  /// Repositories
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(
      sl(),
      sl(),
      sl(),
    ),
  );
  sl.registerLazySingleton<BookmarkRepository>(
    () => BookmarkRepositoryImpl(
      sl(),
    ),
  );

  /// Usecases
  sl.registerLazySingleton(() => GetTrendingCase(sl()));
  sl.registerLazySingleton(() => GetHotCase(sl()));
  sl.registerLazySingleton(() => GetRecommendationCase(sl()));
  sl.registerLazySingleton(() => GetHeadlinesCase(sl()));
  sl.registerLazySingleton(() => SearchNewsCase(sl()));

  sl.registerLazySingleton(() => AddBookmarkCase(sl()));
  sl.registerLazySingleton(() => GetBookmarkCase(sl()));
  sl.registerLazySingleton(() => RemoveBookmarkCase(sl()));

  //! Data

  /// Datasources
  sl.registerLazySingleton<NewsRemoteDataSource>(
    () => NewsRemoteDataSourceImpl(
      http: sl(),
    ),
  );
  sl.registerLazySingleton<NewsLocalDataSource>(
    () => NewsLocalDataSourceImpl(
      storage: sl(),
    ),
  );
  sl.registerLazySingleton<BookmarkLocalDataSource>(
    () => BookmarkLocalDataSourceImpl(
      sl(),
    ),
  );

  //! Core
  sl.registerLazySingleton<NetworkContainer>(
      () => NetworkContainerImpl(dio: sl()));
  sl.registerLazySingleton(() => NavigatorHelper());
  sl.registerLazySingleton(() => RouterGenerator());
  sl.registerLazySingleton(() => StorageHelper());
  sl.registerLazySingleton<NetworkChecher>(() => (NetworkCheckerImpl()));

  //! Plugins

  sl.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: rootUrl,
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000,
        receiveDataWhenStatusError: true,
        contentType: "application/json",
      ),
    ),
  );
}
