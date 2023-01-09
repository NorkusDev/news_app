import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/src/core/core.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key, this.height, this.width}) : super(key: key);

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(15.w / 2),
      decoration: BoxDecoration(
        color: Guide.isDark(context)
            ? Colors.white24
            : Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
      ),
    );
  }
}
