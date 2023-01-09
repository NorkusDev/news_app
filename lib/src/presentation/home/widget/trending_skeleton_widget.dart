import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/component_skeleton.dart';

class TrendingSkeletonWidget extends StatelessWidget {
  const TrendingSkeletonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Skeleton(height: 120.h, width: 120.w),
        SizedBox(width: 15.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(width: 80.w),
              SizedBox(height: 15.w / 2),
              const Skeleton(),
              SizedBox(height: 15.w / 2),
              const Skeleton(),
              SizedBox(height: 15.w / 2),
              Row(
                children: [
                  const Expanded(
                    child: Skeleton(),
                  ),
                  SizedBox(width: 15.w),
                  const Expanded(
                    child: Skeleton(),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
