import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/core.dart';
import '../../domain.dart';

class SearchNewsCase implements UseCase<NewsEntities, SearchNewsParams> {
  final NewsRepository repository;

  SearchNewsCase(this.repository);

  @override
  Future<Either<Failure, NewsEntities>> call(SearchNewsParams params) async {
    return await repository.searchNews(
      limit: params.limit,
      page: params.page,
      keyword: params.query,
    );
  }
}

class SearchNewsParams extends Equatable {
  final String query;
  final int limit;
  final int page;
  const SearchNewsParams({
    required this.query,
    required this.limit,
    required this.page,
  });

  @override
  List<Object> get props => [query, limit, page];
}
