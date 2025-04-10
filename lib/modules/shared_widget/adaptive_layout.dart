import 'package:flutter/material.dart';
import 'package:getx_movie_app/core/utils/adaptive_size_util.dart';

class AdaptiveLayout extends StatelessWidget {
  final Widget mobileScene;
  final Widget? smallTabletScene;
  final Widget? largeTabletScene;
  final Widget? desktopScene;

  const AdaptiveLayout({
    super.key,
    required this.mobileScene,
    this.smallTabletScene,
    this.largeTabletScene,
    this.desktopScene,
  });

  @override
  Widget build(BuildContext context) {
    final Breakpoint breakpoint = Breakpoint.fromContext(context);
    if (breakpoint.deviceClass >= LayoutClass.desktop) {
      return desktopScene ?? mobileScene;
    }
    if (breakpoint.deviceClass >= LayoutClass.largeTablet) {
      return largeTabletScene ?? desktopScene ?? mobileScene;
    }
    if (breakpoint.deviceClass >= LayoutClass.smallTablet) {
      return smallTabletScene ?? mobileScene;
    }
    if (breakpoint.deviceClass >= LayoutClass.mediumHandset) return mobileScene;
    return mobileScene;
  }
}
