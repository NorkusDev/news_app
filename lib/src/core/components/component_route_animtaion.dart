import 'package:flutter/material.dart';

enum ComponentPageTransitionAnimation {
  cupertino,
  slideRight,
  slideDown,
  scale,
  rotate,
  sizeUp,
  fade,
  scaleRotate,
  slideUp
}

class ComponentRouteAnimation {
  static Widget slideRightRoute(
          final BuildContext context,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
          final Widget? child) =>
      SlideTransition(
        position: Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
  static Widget slideDownRoute(
          final BuildContext context,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
          final Widget? child) =>
      SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
            .animate(animation),
        child: child,
      );

  static Widget slideUp(
          final BuildContext context,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
          final Widget? child) =>
      SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(animation),
          child: child);

  static Widget scaleRoute(
          final BuildContext context,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
          final Widget? child) =>
      ScaleTransition(
          scale: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
          child: child);

  static Widget rotationRoute(
          final BuildContext context,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
          final Widget? child) =>
      RotationTransition(
          turns: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.linear)),
          child: child);

  static Widget sizeRoute(
          final BuildContext context,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
          final Widget? child) =>
      Align(
        child: SizeTransition(sizeFactor: animation, child: child),
      );

  static Widget fadeRoute(
          final BuildContext context,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
          final Widget? child) =>
      FadeTransition(opacity: animation, child: child);

  static Widget scaleRotate(
          final BuildContext context,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
          final Widget? child) =>
      ScaleTransition(
        scale: Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn)),
        child: RotationTransition(
          turns: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(parent: animation, curve: Curves.linear)),
          child: child,
        ),
      );

  static Widget getAnimation(
    final BuildContext context,
    final Animation<double> animation,
    final Animation<double> secondaryAnimation,
    final Widget? child,
    final ComponentPageTransitionAnimation transitionAnimation,
  ) {
    switch (transitionAnimation) {
      case ComponentPageTransitionAnimation.cupertino:
        break;
      case ComponentPageTransitionAnimation.slideRight:
        return slideRightRoute(context, animation, secondaryAnimation, child);
      case ComponentPageTransitionAnimation.slideDown:
        return slideDownRoute(context, animation, secondaryAnimation, child);
      case ComponentPageTransitionAnimation.scale:
        return scaleRoute(context, animation, secondaryAnimation, child);
      case ComponentPageTransitionAnimation.rotate:
        return rotationRoute(context, animation, secondaryAnimation, child);
      case ComponentPageTransitionAnimation.sizeUp:
        return sizeRoute(context, animation, secondaryAnimation, child);
      case ComponentPageTransitionAnimation.fade:
        return fadeRoute(context, animation, secondaryAnimation, child);
      case ComponentPageTransitionAnimation.scaleRotate:
        return scaleRotate(context, animation, secondaryAnimation, child);
      case ComponentPageTransitionAnimation.slideUp:
        return slideUp(context, animation, secondaryAnimation, child);
    }
    return Container();
  }
}
