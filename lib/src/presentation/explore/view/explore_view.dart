import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/core.dart';
import '../../../domain/entitites/news_entities.dart';
import '../../home/bloc/enum_home_bloc.dart';
import '../../home/bloc/home_news/home_news_bloc.dart';
import '../../home/widget/trending_skeleton_widget.dart';

class ExploreViews extends StatefulWidget {
  const ExploreViews({super.key});

  @override
  State<ExploreViews> createState() => _ExploreViewsState();
}

class _ExploreViewsState extends State<ExploreViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Guide.isDark(context) ? colorsBlack : colorWhite,
        centerTitle: false,
        actions: [
          ElevatedButton(
            onPressed: () => Guide.to(name: searchNews),
            style: ElevatedButton.styleFrom(
              primary: Guide.isDark(context) ? colorsBlack : colorWhite,
              elevation: 0,
            ),
            child: SvgPicture.asset(
              "assets/icons/search_line.svg",
              height: 24.h,
              width: 24.w,
              color: Guide.isDark(context) ? darkThemeText : colorsBlack,
            ),
          ),
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Discover",
            ).blackSized(26).colors(
                  Guide.isDark(context) ? darkThemeText : colorTextGray,
                ),
            const Text("Search all news around the world").boldSized(10).colors(
                  Guide.isDark(context) ? darkThemeText : colorTextGray,
                ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: Guide.isDark(context)
                  ? [
                      colorsBlack,
                      colorsBlackGray,
                    ]
                  : [
                      colorWhite,
                      colorGray,
                    ],
            ),
          ),
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<HomeNewsBloc>().add(
                    const GetRecommendationNews(
                      query: "technology",
                      limit: 7,
                      page: 1,
                    ),
                  );
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocBuilder<HomeNewsBloc, HomeNewsState>(
                    builder: (_, state) {
                      if (state.statusRecommendation ==
                          HomeBlocStatus.loading) {
                        List loading = [1, 2, 3, 4, 5, 6];
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: loading
                                .asMap()
                                .map(
                                  (index, value) => MapEntry(
                                    index,
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15.w,
                                        vertical: 5.h,
                                      ),
                                      child: Shimmer.fromColors(
                                        baseColor: Guide.isDark(context)
                                            ? Colors.white24
                                            : Colors.black,
                                        highlightColor: darkThemeText,
                                        child: const TrendingSkeletonWidget(),
                                      ),
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                          ),
                        );
                      }

                      if (state.statusRecommendation == HomeBlocStatus.loaded) {
                        List<NewsArticleEntities> recommendation =
                            state.recommendation?.articles ?? [];
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: recommendation
                                .asMap()
                                .map(
                                  (index, value) => MapEntry(
                                    index,
                                    GestureDetector(
                                      onTap: () => Guide.to(
                                        name: detail,
                                        arguments: recommendation[index],
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 15.w,
                                          vertical: 5.h,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                            color: index <= 2
                                                ? Guide.isDark(context)
                                                    ? Colors.grey
                                                        .withOpacity(0.3)
                                                    : borderGray
                                                : Guide.isDark(context)
                                                    ? Colors.grey
                                                        .withOpacity(0.3)
                                                    : borderGray,
                                            width: 1,
                                          ),
                                          color: Guide.isDark(context)
                                              ? colorsBlack
                                              : colorWhite,
                                        ),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: SizedBox(
                                                width: 140.w,
                                                height: 110.h,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      recommendation[index]
                                                          .urlToImage,
                                                  imageBuilder: (c, image) =>
                                                      Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: image,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 5.h,
                                              ),
                                              child: SizedBox(
                                                height: 100.h,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Text(
                                                        recommendation[index]
                                                            .title,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ).blackSized(14).colors(
                                                            Guide.isDark(
                                                                    context)
                                                                ? darkThemeText
                                                                : colorsBlack,
                                                          ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    SizedBox(
                                                      width: 175.w,
                                                      child: Text(
                                                        recommendation[index]
                                                            .description,
                                                        maxLines: 3,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ).boldSized(9).colors(
                                                            Guide.isDark(
                                                                    context)
                                                                ? darkThemeText
                                                                : colorsBlack,
                                                          ),
                                                    ),
                                                    SizedBox(
                                                      height: 5.h,
                                                    ),
                                                    SizedBox(
                                                      width: 180.w,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 10.r,
                                                                backgroundColor:
                                                                    colorPrimary,
                                                                backgroundImage:
                                                                    AssetImage(
                                                                        "assets/profile/${Random().nextInt(4) + 1}.jpg"),
                                                              ),
                                                              SizedBox(
                                                                width: 7.w,
                                                              ),
                                                              Text(
                                                                recommendation[
                                                                        index]
                                                                    .source
                                                                    .name,
                                                              )
                                                                  .boldSized(10)
                                                                  .colors(
                                                                      colorTextGray)
                                                            ],
                                                          ),
                                                          Text(timeago.format(
                                                                  recommendation[
                                                                          index]
                                                                      .publishedAt))
                                                              .boldSized(10)
                                                              .colors(
                                                                colorTextGray,
                                                              ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                          ),
                        );
                      }

                      return Container();
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
