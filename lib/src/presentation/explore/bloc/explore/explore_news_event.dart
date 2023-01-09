part of 'explore_news_bloc.dart';

abstract class ExploreNewsEvent extends Equatable {
  const ExploreNewsEvent();

  @override
  List<Object> get props => [];
}

class ExploreSearchNews extends ExploreNewsEvent {
  final String query;

  final int page;

  const ExploreSearchNews({
    required this.query,
    required this.page,
  });

  @override
  List<Object> get props => [query, page];
}

class ExploreSearchNewsMore extends ExploreNewsEvent {
  const ExploreSearchNewsMore();
  @override
  List<Object> get props => [];
}
