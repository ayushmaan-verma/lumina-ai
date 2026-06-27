import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

/// Lumina AI — Error Route Page.
///
/// A production-quality error page for routing failures.
class ErrorRoutePage extends StatelessWidget {
  const ErrorRoutePage({super.key, this.error});

  final Exception? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfacePrimary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: AppSpacing.paddingXxl,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: AppIconSizes.xl,
                  color: AppColors.error,
                ),
                const SizedBox(height: AppSpacing.xxl),
                Semantics(
                  header: true,
                  child: Text(
                    'Navigation Error',
                    style: AppTypography.heading1,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  error?.toString() ?? 'An unknown routing error occurred.',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.error,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
