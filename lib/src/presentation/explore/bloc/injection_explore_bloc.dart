import 'package:get_it/get_it.dart';

import 'explore/explore_news_bloc.dart';

class ExploreBlocInjection {
  static void init({
    required GetIt sl,
  }) {
    sl.registerFactory(() => ExploreNewsBloc(searchCase: sl()));
  }
}
