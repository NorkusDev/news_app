import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../domain/abstraction/bookmark_repository.dart';
import '../../domain/entitites/news_entities.dart';
import '../datasources/bookmarks/bookmarks_local_data_source.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkLocalDataSource localDataSource;

  BookmarkRepositoryImpl(this.localDataSource);
  @override
  Future<Either<Failure, bool>> addBookmark(NewsEntities news) async {
    try {
      final local = await localDataSource.addBookmark(news.toModel());
      return Right(local);
    } on CacheException catch (_) {
      return Left(
        CacheFailure(
          message: "Failed to add Bookmark News",
        ),
      );
    } catch (_) {
      return Left(
        NetworkFailure(
          responseException: ResponseException.error(
            type: EResponseException.DEFAULTERROR,
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, NewsEntities>> readBookmark() async {
    try {
      final local = await localDataSource.readBookmark();
      return Right(local.toEntity());
    } on CacheException {
      return Left(
        CacheFailure(
          message: "Failed to get Bookmark News",
        ),
      );
    } catch (_) {
      return Left(
        NetworkFailure(
          responseException: ResponseException.error(
            type: EResponseException.DEFAULTERROR,
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> removeBookmark(NewsEntities news) async {
    try {
      final local = await localDataSource.removeBookmark(news.toModel());
      return Right(local);
    } on CacheException catch (_) {
      return Left(
        CacheFailure(
          message: "Failed to remove Bookmark News",
        ),
      );
    } catch (_) {
      return Left(
        NetworkFailure(
          responseException: ResponseException.error(
            type: EResponseException.DEFAULTERROR,
          ),
        ),
      );
    }
  }
}
