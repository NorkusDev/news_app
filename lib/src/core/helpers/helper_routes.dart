import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/core.dart';
import 'package:news_app/src/presentation/home/bloc/category_news/category_news_bloc.dart';

import '../../domain/domain.dart';
import '../../injector.dart';
import '../../presentation/bookmark/bloc/bookmark/bookmark_news_bloc.dart';
import '../../presentation/explore/bloc/explore/explore_news_bloc.dart';
import '../../presentation/explore/view/search_news_view.dart';
import '../../presentation/home/view/category_news_view.dart';
import '../../presentation/home/view/detail_news_view.dart';
import '../../presentation/home/view/splash_view.dart';
import '../../presentation/navigation/view/navigation_view.dart';

class RouterGenerator {
  Route<dynamic>? generate(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case root:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: const RouteSettings(name: root),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const NavigationViews(),
          settings: const RouteSettings(name: home),
        );
      case searchNews:
        return CustomPageRouteBuilder(
          BlocProvider(
            create: (context) => sl<ExploreNewsBloc>()
              ..add(
                const ExploreSearchNews(query: "tech", page: 1),
              ),
            child: const SearchNewsView(),
          ),
          ComponentPageTransitionAnimation.slideRight,
          const RouteSettings(name: searchNews),
        );

      case detail:
        if (arguments is NewsArticleEntities) {
          return CustomPageRouteBuilder(
            BlocProvider(
              create: (_) => sl<BookmarkNewsBloc>(),
              child: DetailNewsView(response: [arguments]),
            ),
            ComponentPageTransitionAnimation.scale,
            const RouteSettings(name: detail),
          );
        }
        break;

      case categoryNews:
        if (arguments is CategoryNewsViewArgument) {
          if (arguments.isKeyword) {
            return CustomPageRouteBuilder(
              BlocProvider(
                create: (context) => sl<CategoryNewsBloc>()
                  ..add(
                    CategoryNewsGetByHeadlines(
                      category: arguments.category,
                      limit: 20,
                      page: 1,
                      query: arguments.query,
                    ),
                  ),
                child: CategoryNewsView(category: arguments),
              ),
              ComponentPageTransitionAnimation.slideRight,
              const RouteSettings(name: categoryNews),
            );
          }
          return CustomPageRouteBuilder(
            BlocProvider(
              create: (context) => sl<CategoryNewsBloc>()
                ..add(
                  CategoryNewsGetByHeadlines(
                    category: arguments.category,
                    limit: 20,
                    page: 1,
                    query: arguments.query,
                  ),
                ),
              child: CategoryNewsView(category: arguments),
            ),
            ComponentPageTransitionAnimation.slideRight,
            const RouteSettings(name: categoryNews),
          );
        }
        break;
    }
    return null;
  }
}

class CustomPageRouteBuilder extends PageRouteBuilder<dynamic> {
  final Widget? page;
  final ComponentPageTransitionAnimation? transitionAnimation;
  final RouteSettings? routeSettings;

  CustomPageRouteBuilder(
      this.page, this.transitionAnimation, this.routeSettings)
      : super(
          settings: routeSettings,
          pageBuilder:
              (final context, final animation, final secondaryAnimation) =>
                  page!,
          transitionsBuilder: (final context, final animation,
                  final secondaryAnimation, final child) =>
              ComponentRouteAnimation.getAnimation(
            context,
            animation,
            secondaryAnimation,
            child,
            transitionAnimation!,
          ),
        );
}
