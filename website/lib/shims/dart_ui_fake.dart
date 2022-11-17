// Fake interface for the logic that this package needs from (web-only) dart:ui.
// This is conditionally exported so the analyzer sees these methods as available.

/// Shim for web_ui engine.PlatformViewRegistry
/// https://github.com/flutter/engine/blob/master/lib/web_ui/lib/ui.dart#L62
// ignore: camel_case_types
class platformViewRegistry {
  const platformViewRegistry._();

  /// Shim for registerViewFactory
  /// https://github.com/flutter/engine/blob/master/lib/web_ui/lib/ui.dart#L72
  static void registerViewFactory(String viewTypeId, dynamic Function(int viewId) viewFactory) {}
}
