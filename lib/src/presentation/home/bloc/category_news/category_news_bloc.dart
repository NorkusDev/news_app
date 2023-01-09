import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../enum_home_bloc.dart';

part 'category_news_event.dart';
part 'category_news_state.dart';

class CategoryNewsBloc extends Bloc<CategoryNewsEvent, CategoryNewsState> {
  final GetHeadlinesCase headlinesCase;
  final GetRecommendationCase recommendationCase;
  CategoryNewsBloc({
    required this.headlinesCase,
    required this.recommendationCase,
  }) : super(const CategoryNewsState()) {
    on<CategoryNewsEvent>((event, emit) {});
    on<CategoryNewsGetByHeadlines>(_onCategoryNewsGetByHeadlines);
    on<CategoryNewsGetMoreByHeadlines>(_onCategoryNewsGetMoreByHeadlines);
    on<CategoryNewsGetByEverything>(_onCategoryNewsGetByEverything);
    on<CategoryNewsGetMoreByEverything>(_onCategoryNewsGetMoreByEverything);
  }

  void _onCategoryNewsGetByHeadlines(
      CategoryNewsGetByHeadlines event, Emitter<CategoryNewsState> emit) async {
    emit(state.copyWith(status: HomeBlocStatus.loading));

    await headlinesCase(
      GetHeadlinesParams(
        limit: event.limit,
        page: event.page,
        category: event.category,
        query: event.query,
      ),
    ).then(
      (value) => value.fold(
        (l) => emit(
          state.copyWith(
            status: HomeBlocStatus.failure,
            message: Guide.failureToMessage(l),
            hasReachedMax: true,
            isFetching: false,
          ),
        ),
        (r) {
          var hasMax = r.total / event.limit;
          emit(
            state.copyWith(
              currentPage: event.page,
              hasReachedMax: hasMax.round() > 1 ? false : true,
              response: r,
              article: r.articles,
              totalResult: r.total,
              status: HomeBlocStatus.loaded,
            ),
          );
        },
      ),
    );
    return;
  }

  void _onCategoryNewsGetByEverything(CategoryNewsGetByEverything event,
      Emitter<CategoryNewsState> emit) async {
    emit(state.copyWith(status: HomeBlocStatus.loading));

    await recommendationCase(
      GetRecommendationParams(
        limit: event.limit,
        page: event.page,
        query: event.query,
      ),
    ).then(
      (value) => value.fold(
        (l) => emit(
          state.copyWith(
            status: HomeBlocStatus.failure,
            message: Guide.failureToMessage(l),
            hasReachedMax: true,
            isFetching: false,
          ),
        ),
        (r) {
          var hasMax = r.total / event.limit;
          emit(
            state.copyWith(
              currentPage: event.page,
              hasReachedMax: hasMax.round() > 1 ? false : true,
              response: r,
              article: r.articles,
              totalResult: r.total,
              status: HomeBlocStatus.loaded,
            ),
          );
        },
      ),
    );
    return;
  }

  void _onCategoryNewsGetMoreByHeadlines(CategoryNewsGetMoreByHeadlines event,
      Emitter<CategoryNewsState> emit) async {
    if (state.hasReachedMax) return;

    if (state.isFetching) return;

    emit(state.copyWith(isFetching: true));

    await headlinesCase(
      GetHeadlinesParams(
        limit: 20,
        page: state.currentPage + 1,
        category: event.category,
        query: event.query,
      ),
    ).then(
      (value) => value.fold(
        (l) => emit(
          state.copyWith(
            status: HomeBlocStatus.failure,
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
              status: HomeBlocStatus.loaded,
              isFetching: false,
            ),
          );
        },
      ),
    );
    return;
  }

  void _onCategoryNewsGetMoreByEverything(CategoryNewsGetMoreByEverything event,
      Emitter<CategoryNewsState> emit) async {
    if (state.hasReachedMax) return;
    if (state.isFetching) return;

    emit(state.copyWith(isFetching: true));

    await recommendationCase(
      GetRecommendationParams(
        limit: 20,
        page: state.currentPage + 1,
        query: event.query,
      ),
    ).then(
      (value) => value.fold(
        (l) => emit(
          state.copyWith(
            status: HomeBlocStatus.failure,
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
              status: HomeBlocStatus.loaded,
              isFetching: false,
            ),
          );
        },
      ),
    );
    return;
  }
}
