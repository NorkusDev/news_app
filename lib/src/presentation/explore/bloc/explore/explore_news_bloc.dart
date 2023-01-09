import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../enum_explore_bloc.dart';

part 'explore_news_event.dart';
part 'explore_news_state.dart';

class ExploreNewsBloc extends Bloc<ExploreNewsEvent, ExploreNewsState> {
  final SearchNewsCase searchCase;
  ExploreNewsBloc({
    required this.searchCase,
  }) : super(const ExploreNewsState()) {
    on<ExploreNewsEvent>((event, emit) {});
    on<ExploreSearchNews>(_onExploreSearchNews);
    on<ExploreSearchNewsMore>(_onExploreSearchNewsMore);
  }

  void _onExploreSearchNews(
      ExploreSearchNews event, Emitter<ExploreNewsState> emit) async {
    emit(state.copyWith(status: ExploreBlocStatus.loading));

    await searchCase(
      SearchNewsParams(
        query: event.query,
        limit: 20,
        page: event.page,
      ),
    ).then(
      (value) => value.fold(
        (l) => emit(
          state.copyWith(
            hasReachedMax: true,
            message: Guide.failureToMessage(l),
            status: ExploreBlocStatus.failure,
          ),
        ),
        (r) {
          var hasMax = r.total / 20;
          emit(
            state.copyWith(
              currentPage: event.page,
              hasReachedMax: hasMax.round() > 1 ? false : true,
              response: r,
              article: r.articles,
              totalResult: r.total,
              keyword: event.query,
              status: ExploreBlocStatus.loaded,
            ),
          );
        },
      ),
    );

    return;
  }

  void _onExploreSearchNewsMore(
      ExploreSearchNewsMore event, Emitter<ExploreNewsState> emit) async {
    if (state.hasReachedMax) return;
    if (state.isFetching) return;

    emit(state.copyWith(isFetching: true));

    await searchCase(
      SearchNewsParams(
        query: state.keyword,
        limit: 20,
        page: state.currentPage + 1,
      ),
    ).then(
      (value) => value.fold(
        (l) => emit(
          state.copyWith(
            status: ExploreBlocStatus.failure,
            message: Guide.failureToMessage(l),
            hasReachedMax: true,
            isFetching: false,
          ),
        ),
        (r) {
          var hasMax = r.total / 20;
          emit(
            state.copyWith(
              hasReachedMax: state.currentPage + 1 > hasMax,
              currentPage: state.currentPage + 1,
              response: r,
              article: state.article + r.articles,
              totalResult: r.total,
              status: ExploreBlocStatus.loaded,
              keyword: state.keyword,
              isFetching: false,
            ),
          );
        },
      ),
    );
    return;
  }
}
