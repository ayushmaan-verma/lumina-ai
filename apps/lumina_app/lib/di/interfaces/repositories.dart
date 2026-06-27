/// Lumina AI — Repository Interfaces (Phase 3.3).
///
/// Placeholders for future data repositories.
/// Repositories handle data fetching and persistence, hiding infrastructure
/// (e.g., Firestore, Hive) from the application layer.

/// Abstract repository for authentication.
abstract interface class AuthenticationRepository {
  // Phase 4: login, logout, currentUser, authStateChanges
}

/// Abstract repository for workspaces.
abstract interface class WorkspaceRepository {
  // Phase 5: getWorkspaces, createWorkspace, updateWorkspace
}

/// Abstract repository for application settings and preferences.
abstract interface class SettingsRepository {
  // Phase 10: getTheme, updateTheme, getPreferences
}

/// Abstract repository for remote storage.
abstract interface class StorageRepository {
  // Phase 5: uploadFile, downloadFile, getDownloadUrl
}

/// Abstract repository for AI interactions.
abstract interface class AIRepository {
  // Phase 6: generateText, analyzeImage
}
