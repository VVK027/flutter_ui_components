import 'package:flutter/foundation.dart';

/// Utility class for platform detection.
///
/// Use this class to check the current target platform in a web-safe manner.
class PlatformUtil {
  /// Returns true if the current platform is Android.
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  /// Returns true if the current platform is iOS.
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  /// Returns true if the current platform is Windows.
  static bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  /// Returns true if the current platform is macOS.
  static bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;
}
