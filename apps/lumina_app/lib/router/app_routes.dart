import 'route_names.dart';
import 'route_paths.dart';

/// Strongly typed enum for application routes.
enum AppRoutes {
  workspaceHome(
    name: RouteNames.workspaceHome,
    path: RoutePaths.workspaceHome,
  ),
  collections(
    name: RouteNames.collections,
    path: RoutePaths.collections,
  ),
  history(
    name: RouteNames.history,
    path: RoutePaths.history,
  ),
  settings(
    name: RouteNames.settings,
    path: RoutePaths.settings,
  ),
  unknown(
    name: RouteNames.unknown,
    path: '',
  );

  final String name;
  final String path;

  const AppRoutes({
    required this.name,
    required this.path,
  });
}
