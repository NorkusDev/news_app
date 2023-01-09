part of 'category_news_bloc.dart';

class CategoryNewsState extends Equatable {
  final HomeBlocStatus status;
  final NewsEntities? response;
  final List<NewsArticleEntities> article;
  final String message;
  final bool hasReachedMax;
  final int totalResult;
  final bool isFetching;
  final int currentPage;
  const CategoryNewsState({
    this.status = HomeBlocStatus.initial,
    this.article = const [],
    this.response,
    this.message = "",
    this.hasReachedMax = false,
    this.totalResult = 0,
    this.isFetching = false,
    this.currentPage = 1,
  });

  CategoryNewsState copyWith({
    HomeBlocStatus? status,
    NewsEntities? response,
    List<NewsArticleEntities>? article,
    String? message,
    bool? hasReachedMax,
    int? totalResult,
    bool? isFetching,
    int? currentPage,
  }) {
    return CategoryNewsState(
      status: status ?? this.status,
      response: response ?? this.response,
      article: article ?? this.article,
      message: message ?? this.message,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      totalResult: totalResult ?? this.totalResult,
      isFetching: isFetching ?? this.isFetching,
      currentPage: currentPage ?? this.currentPage,
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
      currentPage,
    ];
  }
}
