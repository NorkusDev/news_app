import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/core/components/component_theme.dart';

final robotStyle = GoogleFonts.roboto();

extension ComponentStyleText on TextStyle {
  // Font Weight
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);

  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);

  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  TextStyle get normal => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  TextStyle get black => copyWith(fontWeight: FontWeight.w900);

  // Font Styling

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  // Font Extension
  TextStyle size(double sz) => copyWith(fontSize: sz);

  TextStyle colors(Color c) => copyWith(color: c);

  TextStyle weight(FontWeight w) => copyWith(fontWeight: w);

  TextStyle style(FontStyle s) => copyWith(fontStyle: s);
}

extension MyText on Text {
  // Colors
  Text colors(Color c) => Text(
        "$data",
        style: style?.colors(c),
        maxLines: maxLines,
        overflow: overflow,
        textAlign: textAlign,
        locale: locale,
        semanticsLabel: semanticsLabel,
        softWrap: softWrap,
        strutStyle: strutStyle,
        textDirection: textDirection,
        textHeightBehavior: textHeightBehavior,
        textScaleFactor: textScaleFactor,
        textWidthBasis: textWidthBasis,
      );

  Text thinSized(double sz) {
    return Text(
      "$data",
      style: robotStyle.normal.size(sz.sp).colors(colorsBlack),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text thinSizedItalic(double sz) {
    return Text(
      "$data",
      style: robotStyle.normal.size(sz.sp).colors(colorsBlack).italic,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text extraLightSized(double sz) {
    return Text(
      "$data",
      style: robotStyle.extraLight.size(sz.sp).colors(colorsBlack),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text extraLightSizedItalic(double sz) {
    return Text(
      "$data",
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
      style: robotStyle.extraLight.size(sz.sp).colors(colorsBlack).italic,
    );
  }

  Text lightSized(double sz) {
    return Text(
      "$data",
      style: robotStyle.light.size(sz.sp).colors(colorsBlack),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text lightSizedItalic(double sz) {
    return Text(
      "$data",
      style: robotStyle.light.size(sz.sp).colors(colorsBlack).italic,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text normalSized(double sz) {
    return Text(
      "$data",
      style: robotStyle.normal.size(sz.sp).colors(colorsBlack),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text normalSizedItalic(double sz) {
    return Text(
      "$data",
      style: robotStyle.normal.size(sz.sp).colors(colorsBlack).italic,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text mediumSized(double sz) {
    return Text(
      "$data",
      style: robotStyle.medium.size(sz.sp).colors(colorsBlack),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text mediumSizedItalic(double sz) {
    return Text(
      "$data",
      style: robotStyle.medium.size(sz.sp).colors(colorsBlack).italic,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text semiBoldSized(double sz) {
    return Text(
      "$data",
      style: robotStyle.semiBold.size(sz.sp).colors(colorsBlack),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text semiBoldSizedItalic(double sz) {
    return Text(
      "$data",
      style: robotStyle.semiBold.size(sz.sp).colors(colorsBlack).italic,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text boldSized(double sz) {
    return Text(
      "$data",
      style: robotStyle.bold.size(sz.sp).colors(colorsBlack),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text boldSizedItalic(double sz) {
    return Text(
      "$data",
      style: robotStyle.bold.size(sz.sp).colors(colorsBlack).italic,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text extraBoldSized(double sz) {
    return Text(
      "$data",
      style: robotStyle.extraBold.size(sz.sp).colors(colorsBlack),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text extraBoldSizedItalic(double sz) {
    return Text(
      "$data",
      style: robotStyle.extraBold.size(sz.sp).colors(colorsBlack).italic,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text blackSized(double sz) {
    return Text(
      "$data",
      style: robotStyle.black.size(sz.sp).colors(colorsBlack),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }

  Text blackSizedItalic(double sz) {
    return Text(
      "$data",
      style: robotStyle.black.size(sz.sp).colors(colorsBlack).italic,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      locale: locale,
      semanticsLabel: semanticsLabel,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}
