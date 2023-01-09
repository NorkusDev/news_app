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
import '../../home/widget/trending_skeleton_widget.dart';
import '../bloc/bookmark/bookmark_news_bloc.dart';
import '../bloc/enum_explore_bloc.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  final List<NewsEntities> recommendation = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Guide.isDark(context) ? colorsBlack : colorWhite,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bookmarks",
            ).blackSized(26).colors(
                  Guide.isDark(context) ? darkThemeText : colorsBlack,
                ),
            const Text("Save your time by using bookmarks")
                .boldSized(10)
                .colors(
                  Guide.isDark(context) ? darkThemeText : colorTextGray,
                ),
          ],
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<BookmarkNewsBloc>().add(const BookmarkNewsGetEvent());
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
              ),
            ),
            child: BlocBuilder<BookmarkNewsBloc, BookmarkNewsState>(
              builder: (_, state) {
                if (state.status == BookmarkBlocStatus.loading) {
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
                if (state.status == BookmarkBlocStatus.loaded) {
                  final data = state.response?.articles ?? [];

                  return data.isNotEmpty
                      ? ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (c, index) {
                            return Dismissible(
                              key: ObjectKey(data[index]),
                              onDismissed: (direction) {
                                context.read<BookmarkNewsBloc>().add(
                                      BookmarkNewsRemoveEvent(
                                        remove: data,
                                      ),
                                    );
                              },
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                              ),
                              secondaryBackground: Container(
                                margin: EdgeInsets.symmetric(horizontal: 15.w),
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.red,
                                  border: Border.all(
                                    width: 0.5,
                                    color: Guide.isDark(context)
                                        ? Colors.grey.withOpacity(0.5)
                                        : borderGray,
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  size: 30.h,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () => Guide.to(
                                  name: detail,
                                  arguments: data[index],
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Container(
                                    height: 120.h,
                                    margin: EdgeInsets.only(top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Guide.isDark(context)
                                          ? colorsBlack
                                          : colorWhite,
                                      border: Border.all(
                                        width: 0.5,
                                        color: Guide.isDark(context)
                                            ? Colors.grey.withOpacity(0.5)
                                            : borderGray,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: SizedBox(
                                            width: 120.w,
                                            height: 120.h,
                                            child: CachedNetworkImage(
                                              imageUrl: data[index].urlToImage,
                                              imageBuilder: (c, image) =>
                                                  Container(
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
                                            horizontal: 8.w,
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
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ).boldSized(14).colors(
                                                      Guide.isDark(context)
                                                          ? darkThemeText
                                                          : colorsBlack,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 220.w,
                                                child: Text(
                                                  data[index].description,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                                                  "assets/profile/${Random().nextInt(4) + 1}.jpg"),
                                                        ),
                                                        SizedBox(
                                                          width: 7.w,
                                                        ),
                                                        Text(data[index]
                                                                .source
                                                                .name)
                                                            .boldSized(10)
                                                            .colors(
                                                                colorTextGray)
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
                                ),
                              ),
                            );
                          })
                      : SizedBox(
                          height: 700.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/empty.svg",
                                width: 100.w,
                                height: 200.h,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const Text("There is no data saved")
                                  .boldSized(20)
                                  .colors(
                                    Guide.isDark(context)
                                        ? darkThemeText
                                        : colorTextGray,
                                  ),
                              SizedBox(
                                height: 100.h,
                              ),
                              SizedBox(
                                height: 10.h,
                                child: ListView(),
                              ),
                            ],
                          ),
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
