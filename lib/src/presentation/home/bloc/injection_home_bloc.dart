import 'package:get_it/get_it.dart';

import 'category_news/category_news_bloc.dart';
import 'home_news/home_news_bloc.dart';
import 'theme/theme_mode_bloc.dart';

class HomeBlocInjection {
  static void init({
    required GetIt sl,
  }) {
    sl.registerFactory(() => ThemeModeBloc(storage: sl()));
    sl.registerFactory(
        () => CategoryNewsBloc(headlinesCase: sl(), recommendationCase: sl()));
    sl.registerFactory(() => HomeNewsBloc(
        getTrendingCase: sl(), hotCase: sl(), recommendationCase: sl()));
  }
}
