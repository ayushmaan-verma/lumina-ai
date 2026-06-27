/// Lumina AI — Service Interfaces (Phase 3.3).
///
/// Placeholders for future application services.
/// Services handle specific domain logic or infrastructure concerns that don't
/// fit neatly into a data repository (e.g., logging, analytics).

/// Abstract service for event analytics.
abstract interface class AnalyticsService {
  // Phase 13: logEvent, setUserId, setUserProperty
}

/// Abstract service for application logging.
abstract interface class LoggingService {
  // Phase 3.4: verbose, debug, info, warning, error
}

/// Abstract service for crash reporting.
abstract interface class CrashReportingService {
  // Phase 3.4: recordError, recordFlutterError, log
}

/// Abstract service for notifications.
abstract interface class NotificationService {
  // Phase 10: requestPermission, showNotification
}

/// Abstract service for specialized background storage tasks.
abstract interface class StorageService {
  // Phase 5: compressImage, cacheFile
}
