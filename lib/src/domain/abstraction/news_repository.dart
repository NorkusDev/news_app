import 'package:dartz/dartz.dart';
import 'package:news_app/src/core/core.dart';
import 'package:news_app/src/domain/entitites/news_entities.dart';

abstract class NewsRepository {
  Future<Either<Failure, NewsEntities>> getTrending();
  Future<Either<Failure, NewsEntities>> searchNews({
    required String keyword,
    required int limit,
    required int page,
  });
  Future<Either<Failure, NewsEntities>> getRecommendation({
    String? query,
    int? limit,
    int? page,
  });
  Future<Either<Failure, NewsEntities>> getHotNews();
  Future<Either<Failure, NewsEntities>> getNewsByHeadlines({
    String? category,
    String? query,
    required int limit,
    required int page,
  });
}
