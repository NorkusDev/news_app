import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/src/presentation/home/bloc/home_news/home_news_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../core/components/component_theme.dart';
import '../../../injector.dart';
import '../../bookmark/bloc/bookmark/bookmark_news_bloc.dart';
import '../../bookmark/view/bookmark_view.dart';
import '../../explore/view/explore_view.dart';
import '../../home/view/home_view.dart';

class NavigationViews extends StatelessWidget {
  const NavigationViews({super.key});

  List<Widget> _buildScreens() {
    return [
      BlocProvider(
        create: (_) => sl<HomeNewsBloc>()
          ..add(const GetTrendingNews())
          ..add(const GetHotNews())
          ..add(const GetRecommendationNews()),
        child: const HomeView(),
      ),
      // const HomeView(),
      BlocProvider(
        create: (_) => sl<HomeNewsBloc>()
          ..add(
            const GetRecommendationNews(
              query: "technology",
              limit: 7,
              page: 1,
            ),
          ),
        child: const ExploreViews(),
      ),
      BlocProvider(
        create: (_) => sl<BookmarkNewsBloc>()
          ..add(
            const BookmarkNewsGetEvent(),
          ),
        child: const BookmarkView(),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/home_solid.svg",
          height: 20.h,
          width: 20.w,
          color: colorPrimary,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/icons/home_line.svg",
          height: 20.h,
          width: 20.w,
          color: Theme.of(context).brightness == Brightness.dark
              ? colorWhite
              : colorsBlack,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/search_solid.svg",
          color: colorPrimary,
          height: 20.h,
          width: 20.w,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/icons/search_line.svg",
          height: 20.h,
          width: 20.w,
          color: Theme.of(context).brightness == Brightness.dark
              ? colorWhite
              : colorsBlack,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          "assets/icons/layers_solid.svg",
          height: 20.h,
          width: 20.w,
          color: colorPrimary,
        ),
        inactiveIcon: SvgPicture.asset(
          "assets/icons/layers_line.svg",
          height: 20.h,
          width: 20.w,
          color: Theme.of(context).brightness == Brightness.dark
              ? colorWhite
              : colorsBlack,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      navBarHeight: 65.h,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? colorsBlack
          : colorWhite,
      confineInSafeArea: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.2,
            spreadRadius: 0.2,
          ),
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style11,
    );
  }
}
