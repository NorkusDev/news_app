import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/components/component_skeleton.dart';

class HotSekeletonWidget extends StatelessWidget {
  const HotSekeletonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Skeleton(height: 100.h, width: 184.w),
        SizedBox(height: 5.h),
        SizedBox(
          width: 180.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15.w / 2),
              const Skeleton(),
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
        ),
        SizedBox(height: 5.h),
        // Flexible(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Skeleton(width: 80.w),
        //       SizedBox(height: 15.w / 2),
        //       const Skeleton(),
        //       SizedBox(height: 15.w / 2),
        //       const Skeleton(),
        //       SizedBox(height: 15.w / 2),
        //       Row(
        //         children: [
        //           const Expanded(
        //             child: Skeleton(),
        //           ),
        //           SizedBox(width: 15.w),
        //           const Expanded(
        //             child: Skeleton(),
        //           ),
        //         ],
        //       )
        //     ],
        //   ),
        // )
      ],
    );
  }
}
