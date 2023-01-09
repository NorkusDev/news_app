part of 'bookmark_news_bloc.dart';

class BookmarkNewsState extends Equatable {
  final NewsEntities? response;
  final BookmarkBlocStatus status;
  final String message;
  const BookmarkNewsState({
    this.response,
    this.status = BookmarkBlocStatus.initial,
    this.message = "",
  });

  BookmarkNewsState copyWith({
    NewsEntities? response,
    BookmarkBlocStatus? status,
    String? message,
  }) {
    return BookmarkNewsState(
      response: response ?? this.response,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [response, status, message];
}
