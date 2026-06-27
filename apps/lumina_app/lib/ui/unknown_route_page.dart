import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

/// Lumina AI — Unknown Route Page.
///
/// A production-quality 404 page for unknown routes.
class UnknownRoutePage extends StatelessWidget {
  const UnknownRoutePage({super.key});

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
                  Icons.question_mark_outlined,
                  size: AppIconSizes.xl,
                  color: AppColors.error,
                ),
                const SizedBox(height: AppSpacing.xxl),
                Semantics(
                  header: true,
                  child: Text(
                    'Page Not Found',
                    style: AppTypography.heading1,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  'The requested route does not exist.',
                  style: AppTypography.bodySmall,
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
