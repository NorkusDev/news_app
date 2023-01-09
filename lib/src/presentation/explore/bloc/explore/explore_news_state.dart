part of 'explore_news_bloc.dart';

class ExploreNewsState extends Equatable {
  final ExploreBlocStatus status;
  final NewsEntities? response;
  final List<NewsArticleEntities> article;
  final String message;
  final bool hasReachedMax;
  final int totalResult;
  final bool isFetching;
  final int currentPage;
  final String keyword;
  const ExploreNewsState({
    this.status = ExploreBlocStatus.initial,
    this.article = const [],
    this.response,
    this.message = "",
    this.hasReachedMax = false,
    this.totalResult = 0,
    this.isFetching = false,
    this.currentPage = 1,
    this.keyword = "indonesia",
  });

  ExploreNewsState copyWith({
    ExploreBlocStatus? status,
    NewsEntities? response,
    List<NewsArticleEntities>? article,
    String? message,
    bool? hasReachedMax,
    int? totalResult,
    bool? isFetching,
    int? currentPage,
    String? keyword,
  }) {
    return ExploreNewsState(
      status: status ?? this.status,
      response: response ?? this.response,
      article: article ?? this.article,
      message: message ?? this.message,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      totalResult: totalResult ?? this.totalResult,
      isFetching: isFetching ?? this.isFetching,
      currentPage: currentPage ?? this.currentPage,
      keyword: keyword ?? this.keyword,
    );
  }

  @override
  List<Object?> get props {
    return [
      status,
      response,
      article,
      message,
      hasReachedMax,
      totalResult,
      isFetching,
      keyword,
      currentPage,
    ];
  }
}
