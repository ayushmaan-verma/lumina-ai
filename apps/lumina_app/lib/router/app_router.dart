import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_shell.dart';
import '../navigation/workspace_placeholder.dart';
import '../ui/error_route_page.dart';
import '../ui/settings_placeholder.dart';
import '../ui/placeholder_page.dart';
import '../ui/unknown_route_page.dart';
import 'app_routes.dart';
import 'route_observer.dart';

/// The root navigator key.
final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

/// The central application router.
class AppRouter {
  AppRouter._();

  /// Creates and configures the [GoRouter] instance.
  static GoRouter createRouter({required VoidCallback onToggleTheme}) {
    return GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: AppRoutes.workspaceHome.path,
      debugLogDiagnostics: true,
      observers: [
        AppRouteObserver(),
      ],
      redirect: (context, state) {
        // Architecture placeholder for future authentication logic.
        return null;
      },
      errorBuilder: (context, state) {
        // Distinguish between 404 and other errors
        if (state.error != null && state.error.toString().contains('no match')) {
          return const UnknownRoutePage();
        }
        return ErrorRoutePage(error: state.error);
      },
      routes: [
        // Shell route encapsulates the global UI (sidebar/bottom nav).
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return AppShell(
              onToggleTheme: onToggleTheme,
              navigationShell: navigationShell,
            );
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.workspaceHome.path,
                  name: AppRoutes.workspaceHome.name,
                  builder: (context, state) => const WorkspacePlaceholder(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.collections.path,
                  name: AppRoutes.collections.name,
                  builder: (context, state) => const PlaceholderPage(
                    title: 'Collections',
                    icon: Icons.folder_outlined,
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.history.path,
                  name: AppRoutes.history.name,
                  builder: (context, state) => const PlaceholderPage(
                    title: 'History',
                    icon: Icons.history_outlined,
                  ),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.settings.path,
                  name: AppRoutes.settings.name,
                  builder: (context, state) => const SettingsPlaceholder(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
