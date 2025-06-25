import 'package:flutter/foundation.dart';

mixin RunMode {
  static bool get isDebug => kDebugMode;
  static bool get isProfile => kProfileMode;
  static bool get isRelease => kReleaseMode;

  static String get name {
    if (isDebug) {
      return 'DEBUG';
    } else if (isProfile) {
      return 'PROFILE';
    } else if (isRelease) {
      return 'RELEASE';
    } else {
      return 'UNKNOWN';
    }
  }
}
