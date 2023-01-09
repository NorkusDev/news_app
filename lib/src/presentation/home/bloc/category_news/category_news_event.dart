part of 'category_news_bloc.dart';

abstract class CategoryNewsEvent extends Equatable {
  const CategoryNewsEvent();

  @override
  List<Object?> get props => [];
}

class CategoryNewsGetByHeadlines extends CategoryNewsEvent {
  final String category;
  final String? query;
  final int limit;
  final int page;

  const CategoryNewsGetByHeadlines({
    required this.category,
    this.query,
    required this.limit,
    required this.page,
  });

  @override
  List<Object?> get props => [category, query, limit, page];
}

class CategoryNewsGetMoreByHeadlines extends CategoryNewsEvent {
  final String category;
  final String? query;
  const CategoryNewsGetMoreByHeadlines({
    required this.category,
    this.query,
  });

  @override
  List<Object?> get props => [category, query];
}

class CategoryNewsGetByEverything extends CategoryNewsEvent {
  final String? query;
  final int limit;
  final int page;

  const CategoryNewsGetByEverything({
    this.query,
    required this.limit,
    required this.page,
  });

  @override
  List<Object?> get props => [query, limit, page];
}

class CategoryNewsGetMoreByEverything extends CategoryNewsEvent {
  final String? query;
  const CategoryNewsGetMoreByEverything({
    this.query,
  });

  @override
  List<Object?> get props => [query];
}
