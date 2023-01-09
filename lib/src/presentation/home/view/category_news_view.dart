import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/core.dart';
import '../bloc/category_news/category_news_bloc.dart';
import '../bloc/enum_home_bloc.dart';
import '../widget/trending_skeleton_widget.dart';

class CategoryNewsView extends StatefulWidget {
  final CategoryNewsViewArgument category;
  const CategoryNewsView({
    super.key,
    required this.category,
  });

  @override
  State<CategoryNewsView> createState() => _CategoryNewsViewState();
}

class _CategoryNewsViewState extends State<CategoryNewsView> {
  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    controller.addListener(() {
      if (controller.offset >= controller.position.maxScrollExtent) {
        context.read<CategoryNewsBloc>().add(
              CategoryNewsGetMoreByHeadlines(
                category: widget.category.category,
                query: widget.category.query,
              ),
            );
        return;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Guide.isDark(context) ? colorsBlack : colorWhite,
        centerTitle: true,
        title: Text(Guide.capitalize(widget.category.category))
            .boldSized(16)
            .colors(Guide.isDark(context) ? darkThemeText : colorsBlack),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            !widget.category.isKeyword
                ? context.read<CategoryNewsBloc>().add(
                      CategoryNewsGetByHeadlines(
                        category: widget.category.category,
                        limit: 20,
                        page: 1,
                        query: "",
                      ),
                    )
                : context.read<CategoryNewsBloc>().add(
                      CategoryNewsGetByHeadlines(
                        category: widget.category.category,
                        limit: 20,
                        page: 1,
                        query: "",
                      ),
                    );
          },
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
                // stops: [],
              ),
            ),
            child: BlocBuilder<CategoryNewsBloc, CategoryNewsState>(
              builder: (_, state) {
                if (state.status == HomeBlocStatus.loading) {
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

                if (state.status == HomeBlocStatus.loaded) {
                  final data = state.article;
                  return ListView.builder(
                    controller: controller,
                    itemCount:
                        state.hasReachedMax ? data.length : data.length + 1,
                    itemBuilder: (ctx, index) {
                      return index >= data.length
                          ? data.length >= 10
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        height: 33.h,
                                        child: const CircularProgressIndicator(
                                          color: colorPrimary,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    )
                                  ],
                                )
                              : Container()
                          : GestureDetector(
                              onTap: () => Guide.to(
                                name: detail,
                                arguments: data[index],
                              ),
                              child: Container(
                                height: 100.h,
                                margin: EdgeInsets.symmetric(
                                    vertical: 4.h, horizontal: 15.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Guide.isDark(context)
                                      ? colorsBlack
                                      : colorWhite,
                                  border: Border.all(
                                    color: Guide.isDark(context)
                                        ? Colors.grey.withOpacity(0.2)
                                        : borderGray,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: SizedBox(
                                        width: 115.w,
                                        height: 100.h,
                                        child: CachedNetworkImage(
                                          imageUrl: data[index].urlToImage,
                                          imageBuilder: (c, image) => Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 8.h,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 220.w,
                                            child: Text(
                                              data[index].title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ).boldSized(14).colors(
                                                Guide.isDark(context)
                                                    ? darkThemeText
                                                    : colorsBlack),
                                          ),
                                          SizedBox(
                                            width: 220.w,
                                            child: Text(
                                              data[index].description,
                                              maxLines: 3,
                                              textAlign: TextAlign.justify,
                                              overflow: TextOverflow.ellipsis,
                                            ).normalSized(12).colors(
                                                  Guide.isDark(context)
                                                      ? darkThemeText
                                                      : colorsBlack,
                                                ),
                                          ),
                                          SizedBox(
                                            width: 210.w,
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
                                                        "assets/profile/${Random().nextInt(4) + 1}.jpg",
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 7.w,
                                                    ),
                                                    SizedBox(
                                                      width: 110.w,
                                                      child: Text(
                                                        data[index].source.name,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ).boldSized(10).colors(
                                                          colorTextGray),
                                                    )
                                                  ],
                                                ),
                                                Text(
                                                  timeago.format(
                                                    data[index].publishedAt,
                                                  ),
                                                )
                                                    .boldSized(10)
                                                    .colors(colorTextGray),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
