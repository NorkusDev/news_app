import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void setUpScreenUtils(BuildContext context) {
  ScreenUtil.init(
    context,
    designSize: const Size(390, 844),
    minTextAdapt: true,
    splitScreenMode: false,
  );
  return;
}

void setStatusBar({
  Brightness brightness = Brightness.dark,
  Color color = Colors.transparent,
}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: brightness,
    ),
  );
}
