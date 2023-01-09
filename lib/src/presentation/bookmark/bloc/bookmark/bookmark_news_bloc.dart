import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/src/core/core.dart';
import 'package:news_app/src/domain/usecases/bookmarks/remove_bookmark_case.dart';

import '../../../../domain/domain.dart';
import '../enum_explore_bloc.dart';

part 'bookmark_news_event.dart';
part 'bookmark_news_state.dart';

class BookmarkNewsBloc extends Bloc<BookmarkNewsEvent, BookmarkNewsState> {
  final AddBookmarkCase addBookmarkCase;
  final GetBookmarkCase getBookmarkCase;
  final RemoveBookmarkCase removeBookmarkCase;
  BookmarkNewsBloc({
    required this.addBookmarkCase,
    required this.getBookmarkCase,
    required this.removeBookmarkCase,
  }) : super(const BookmarkNewsState()) {
    on<BookmarkNewsEvent>((event, emit) {});
    on<BookmarkNewsGetEvent>(_onBookmarkNewsGetEvent);
    on<BookmarkNewsAddEvent>(_onBookmarkNewsAddEvent);
    on<BookmarkNewsRemoveEvent>(_onBookmarkNewsRemoveEvent);
  }

  void _onBookmarkNewsGetEvent(
      BookmarkNewsGetEvent event, Emitter<BookmarkNewsState> emit) async {
    emit(state.copyWith(status: BookmarkBlocStatus.loading));
    await getBookmarkCase(NoParams()).then(
      (value) => value.fold(
        (l) => emit(
          state.copyWith(
            status: BookmarkBlocStatus.failure,
            message: Guide.failureToMessage(l),
          ),
        ),
        (r) => emit(
          state.copyWith(
            status: BookmarkBlocStatus.loaded,
            response: r,
          ),
        ),
      ),
    );
    return;
  }

  void _onBookmarkNewsAddEvent(
      BookmarkNewsAddEvent event, Emitter<BookmarkNewsState> emit) async {
    emit(state.copyWith(status: BookmarkBlocStatus.loading));
    final data = NewsEntities(status: "ok", total: 1, articles: event.add);
    await addBookmarkCase(AddBookmarkParams(data)).then(
      (value) => value.fold(
        (l) => emit(
          state.copyWith(
            status: BookmarkBlocStatus.failure,
            message: Guide.failureToMessage(l),
          ),
        ),
        (r) => emit(
          state.copyWith(
            status: BookmarkBlocStatus.loaded,
          ),
        ),
      ),
    );
    return;
  }

  void _onBookmarkNewsRemoveEvent(
      BookmarkNewsRemoveEvent event, Emitter<BookmarkNewsState> emit) async {
    final data = NewsEntities(status: "ok", total: 1, articles: event.remove);
    await removeBookmarkCase(RemoveBookmarkParams(data)).then(
      (value) => value.fold(
        (l) => emit(
          state.copyWith(
            status: BookmarkBlocStatus.failure,
            message: Guide.failureToMessage(l),
          ),
        ),
        (r) => emit(
          state.copyWith(
            status: BookmarkBlocStatus.loaded,
          ),
        ),
      ),
    );
    return;
  }
}
