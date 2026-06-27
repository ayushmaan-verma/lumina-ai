import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

/// Lumina AI — Generic Placeholder Page.
///
/// A production-quality placeholder for unbuilt sections.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: AppSpacing.paddingXxl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: AppIconSizes.xl,
                color: AppColors.textPrimary,
              ),
              const SizedBox(height: AppSpacing.xxl),
              Semantics(
                header: true,
                child: Text(
                  title,
                  style: AppTypography.heading1,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                '$title features will be available in a future milestone.',
                style: AppTypography.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
