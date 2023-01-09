import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/components/component_constant.dart';
import 'src/core/components/component_theme.dart';
import 'src/core/helpers/helper_routes.dart';
import 'src/core/helpers/helper_routes_parh.dart';
import 'src/core/helpers/helper_utils.dart';
import 'src/injector.dart';
import 'src/presentation/home/bloc/theme/theme_mode_bloc.dart';

void main() async {
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    setStatusBar();
    return BlocProvider<ThemeModeBloc>(
      create: (_) => sl<ThemeModeBloc>()..add(const ReadThemeModeEvent()),
      child: BlocBuilder<ThemeModeBloc, ThemeModeState>(
        builder: (_, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ligthTheme,
            darkTheme: darkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            builder: (c, w) {
              setUpScreenUtils(c);
              return MediaQuery(
                data: MediaQuery.of(c).copyWith(textScaleFactor: 1.0),
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: w!,
                ),
              );
            },
            navigatorKey: sl<NavigatorHelper>().kNavKey,
            scaffoldMessengerKey: sl<NavigatorHelper>().kscaffoldMessengerKey,
            initialRoute: root,
            onGenerateRoute: sl<RouterGenerator>().generate,
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
