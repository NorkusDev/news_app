import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain.dart';

class GetRecommendationCase
    implements UseCase<NewsEntities, GetRecommendationParams> {
  final NewsRepository repository;

  GetRecommendationCase(this.repository);
  @override
  Future<Either<Failure, NewsEntities>> call(
      GetRecommendationParams params) async {
    return await repository.getRecommendation(
      query: params.query,
      limit: params.limit,
      page: params.page,
    );
  }
}

class GetRecommendationParams {
  final String? query;
  final int? limit;
  final int? page;

  GetRecommendationParams({this.query, this.limit, this.page});
}
