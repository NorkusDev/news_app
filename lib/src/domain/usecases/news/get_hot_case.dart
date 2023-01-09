import 'package:dartz/dartz.dart';
import 'package:news_app/src/core/core.dart';
import 'package:news_app/src/domain/domain.dart';

class GetHotCase implements UseCase<NewsEntities, NoParams> {
  final NewsRepository repository;

  GetHotCase(this.repository);

  @override
  Future<Either<Failure, NewsEntities>> call(NoParams params) async {
    return await repository.getHotNews();
  }
}
