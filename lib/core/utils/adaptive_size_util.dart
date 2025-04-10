import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool get isMobileDevice =>
    !kIsWeb && (GetPlatform.isIOS || GetPlatform.isAndroid);

bool get isDesktopDevice =>
    !kIsWeb &&
    (GetPlatform.isMacOS || GetPlatform.isWindows || GetPlatform.isLinux);

bool isTabletView(Breakpoint breakpoint) =>
    !(breakpoint.deviceClass >= LayoutClass.desktop &&
        breakpoint.window >= WindowSize.large) &&
    breakpoint.deviceClass >= LayoutClass.largeTablet;

bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;

bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

class Breakpoint {
  final WindowSize window;
  final LayoutClass deviceClass;
  final int columns;
  final double gutterSize;
  final bool isLargeScreen;

  const Breakpoint._internal({
    required this.columns,
    required this.deviceClass,
    required this.gutterSize,
    required this.window,
    required this.isLargeScreen,
  });

  factory Breakpoint.fromConstraints(BoxConstraints constraints) {
    double width = 359;

    Orientation orientation = Orientation.portrait;

    if (constraints.debugAssertIsValid()) {
      width = constraints.normalize().maxWidth;
      orientation = constraints.maxHeight > constraints.maxWidth
          ? Orientation.portrait
          : Orientation.landscape;
    }

    return _getBreakpoint(orientation, width);
  }

  factory Breakpoint.fromContext(BuildContext context) {
    final media = MediaQuery.of(context);

    double width = 359;

    Orientation orientation = Orientation.portrait;
    width = media.size.width;

    orientation = media.orientation;

    return _getBreakpoint(orientation, width);
  }

  static Breakpoint _getBreakpoint(Orientation orientation, double width) {
    if (orientation == Orientation.landscape) {
      width += 120;
    }

    if (width >= 1920) {
      return const Breakpoint._internal(
        columns: 12,
        gutterSize: 24,
        deviceClass: LayoutClass.desktop,
        window: WindowSize.xLarge,
        isLargeScreen: true,
      );
    }
    if (width >= 1440) {
      return const Breakpoint._internal(
        columns: 12,
        gutterSize: 24,
        deviceClass: LayoutClass.desktop,
        window: WindowSize.large,
        isLargeScreen: true,
      );
    }
    if (width >= 1024) {
      return const Breakpoint._internal(
        columns: 12,
        gutterSize: 24,
        deviceClass: LayoutClass.desktop,
        window: WindowSize.medium,
        isLargeScreen: true,
      );
    }
    if (width >= 840) {
      return const Breakpoint._internal(
        columns: 12,
        gutterSize: 24,
        deviceClass: LayoutClass.largeTablet,
        window: WindowSize.small,
        isLargeScreen: true,
      );
    }
    if (width >= 720) {
      return const Breakpoint._internal(
        columns: 8,
        gutterSize: 24,
        deviceClass: LayoutClass.largeTablet,
        window: WindowSize.small,
        isLargeScreen: true,
      );
    }
    if (width >= 600) {
      return const Breakpoint._internal(
        columns: 8,
        gutterSize: 16,
        deviceClass: LayoutClass.smallTablet,
        window: WindowSize.small,
        isLargeScreen: false,
      );
    }
    if (width >= 400) {
      return const Breakpoint._internal(
        columns: 4,
        gutterSize: 16,
        deviceClass: LayoutClass.largeHandset,
        window: WindowSize.xSmall,
        isLargeScreen: false,
      );
    }
    if (width >= 360) {
      return const Breakpoint._internal(
        columns: 4,
        gutterSize: 16,
        deviceClass: LayoutClass.mediumHandset,
        window: WindowSize.xSmall,
        isLargeScreen: false,
      );
    }
    return const Breakpoint._internal(
      columns: 4,
      gutterSize: 16,
      deviceClass: LayoutClass.smallHandset,
      window: WindowSize.xSmall,
      isLargeScreen: false,
    );
  }

  @override
  String toString() {
    return 'Breakpoint{window: $window, deviceClass: $deviceClass}';
  }
}

enum WindowSize {
  xSmall,
  small,
  medium,
  large,
  xLarge,
}

enum LayoutClass {
  smallHandset,
  mediumHandset,
  largeHandset,
  smallTablet,
  largeTablet,
  desktop,
}

extension LayoutClassOperators on LayoutClass {
  int get value => LayoutClass.values.indexOf(this);

  /// Whether this [LayoutClass] is larger than [other].
  bool operator >(LayoutClass other) => value > other.value;

  /// Whether this [LayoutClass] is larger than or equal to [other].
  bool operator >=(LayoutClass other) => value >= other.value;

  /// Whether this [LayoutClass] is smaller than [other].
  bool operator <(LayoutClass other) => value < other.value;

  /// Whether this [WindowSize] is smaller than or equal to [other].
  bool operator <=(LayoutClass other) => value <= other.value;
}

extension WindowSizeOperators on WindowSize {
  int get value => WindowSize.values.indexOf(this);

  /// Whether this [WindowSize] is larger than [other].
  bool operator >(WindowSize other) => value > other.value;

  /// Whether this [WindowSize] is larger than or equal to [other].
  bool operator >=(WindowSize other) => value >= other.value;

  /// Whether this [WindowSize] is smaller than [other].
  bool operator <(WindowSize other) => value < other.value;

  /// Whether this [WindowSize] is smaller than or equal to [other].
  bool operator <=(WindowSize other) => value <= other.value;
}
