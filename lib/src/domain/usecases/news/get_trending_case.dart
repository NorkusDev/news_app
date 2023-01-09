import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../abstraction/news_repository.dart';
import '../../entitites/news_entities.dart';

class GetTrendingCase implements UseCase<NewsEntities, NoParams> {
  final NewsRepository repository;

  GetTrendingCase(this.repository);
  @override
  Future<Either<Failure, NewsEntities>> call(NoParams params) async {
    return await repository.getTrending();
  }
}
