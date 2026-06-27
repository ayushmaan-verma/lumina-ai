import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

/// Centralized navigation helpers for typed routing.
extension AppRouterExtension on BuildContext {
  /// Navigates to a route defined by [AppRoutes].
  void goRoute(
    AppRoutes route, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    goNamed(
      route.name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// Pushes a route defined by [AppRoutes].
  void pushRoute(
    AppRoutes route, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    pushNamed(
      route.name,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }
}
