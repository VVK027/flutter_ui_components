import 'package:flutter/material.dart';

/// Imperative navigation helpers using Flutter's [Navigator].
///
/// Works with [MaterialApp], [MaterialApp.router], and other widgets that
/// provide a [Navigator]. Named-route methods require [MaterialApp.routes] or
/// [MaterialApp.onGenerateRoute].
///
/// Example:
/// ```dart
/// // Named route (requires routes / onGenerateRoute)
/// NavigationUtil.push(context, '/settings', arguments: {'tab': 0});
///
/// // Widget route
/// NavigationUtil.pushPage(context, const SettingsScreen());
///
/// // Clear stack and go to login
/// NavigationUtil.pushReplaceUntil(context, '/login');
/// ```
class NavigationUtil {
  NavigationUtil._();

  // --- Widget routes ---------------------------------------------------------

  static Future<T?> pushPage<T>(
    BuildContext context,
    Widget page, {
    String? routeName,
    Object? arguments,
    bool fullscreenDialog = false,
    bool useRootNavigator = false,
  }) {
    return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(
      MaterialPageRoute<T>(
        settings: RouteSettings(name: routeName, arguments: arguments),
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  static Future<T?> pushReplacementPage<T extends Object?, TO extends Object?>(
    BuildContext context,
    Widget page, {
    String? routeName,
    Object? arguments,
    TO? result,
    bool fullscreenDialog = false,
    bool useRootNavigator = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: useRootNavigator,
    ).pushReplacement<T, TO>(
      MaterialPageRoute<T>(
        settings: RouteSettings(name: routeName, arguments: arguments),
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
      ),
      result: result,
    );
  }

  static Future<T?> pushPageAndRemoveUntil<T>(
    BuildContext context,
    Widget page,
    RoutePredicate predicate, {
    String? routeName,
    Object? arguments,
    bool fullscreenDialog = false,
    bool useRootNavigator = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: useRootNavigator,
    ).pushAndRemoveUntil<T>(
      MaterialPageRoute<T>(
        settings: RouteSettings(name: routeName, arguments: arguments),
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
      ),
      predicate,
    );
  }

  /// Pops every route on the stack, then pushes [page] as the only route.
  static Future<T?> pushReplacementPageUntil<T>(
    BuildContext context,
    Widget page, {
    String? routeName,
    Object? arguments,
    bool fullscreenDialog = false,
    bool useRootNavigator = false,
  }) {
    return pushPageAndRemoveUntil<T>(
      context,
      page,
      (_) => false,
      routeName: routeName,
      arguments: arguments,
      fullscreenDialog: fullscreenDialog,
      useRootNavigator: useRootNavigator,
    );
  }

  // --- Named routes ----------------------------------------------------------

  static Future<T?> push<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    bool useRootNavigator = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: useRootNavigator,
    ).pushNamed<T>(routeName, arguments: arguments);
  }

  static Future<T?> pushReplace<T extends Object?, TO extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    TO? result,
    bool useRootNavigator = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: useRootNavigator,
    ).pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
      result: result,
    );
  }

  static Future<T?> pushAndRemoveUntil<T>(
    BuildContext context,
    String routeName,
    RoutePredicate predicate, {
    Object? arguments,
    bool useRootNavigator = false,
  }) {
    return Navigator.of(
      context,
      rootNavigator: useRootNavigator,
    ).pushNamedAndRemoveUntil<T>(routeName, predicate, arguments: arguments);
  }

  /// Pops every route on the stack, then pushes [routeName] as the only route.
  static Future<T?> pushReplaceUntil<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
    bool useRootNavigator = false,
  }) {
    return pushAndRemoveUntil<T>(
      context,
      routeName,
      (_) => false,
      arguments: arguments,
      useRootNavigator: useRootNavigator,
    );
  }

  // --- Pop -------------------------------------------------------------------

  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.of(context).pop<T>(result);
  }

  static Future<bool> maybePop<T>(BuildContext context, [T? result]) {
    return Navigator.of(context).maybePop<T>(result);
  }

  static void popUntil(BuildContext context, String routeName) {
    Navigator.of(context).popUntil(ModalRoute.withName(routeName));
  }

  static void popUntilPredicate(
    BuildContext context,
    RoutePredicate predicate,
  ) {
    Navigator.of(context).popUntil(predicate);
  }

  static bool canPop(BuildContext context) {
    return Navigator.of(context).canPop();
  }
}
