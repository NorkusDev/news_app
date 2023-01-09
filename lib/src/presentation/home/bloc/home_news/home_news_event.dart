part of 'home_news_bloc.dart';

abstract class HomeNewsEvent extends Equatable {
  const HomeNewsEvent();

  @override
  List<Object?> get props => [];
}

class GetTrendingNews extends HomeNewsEvent {
  const GetTrendingNews();

  @override
  List<Object> get props => [];
}

class GetHotNews extends HomeNewsEvent {
  const GetHotNews();

  @override
  List<Object> get props => [];
}

class GetRecommendationNews extends HomeNewsEvent {
  final String? query;
  final int? limit;
  final int? page;
  const GetRecommendationNews({
    this.query,
    this.limit,
    this.page,
  });

  @override
  List<Object?> get props => [query, limit, page];
}
