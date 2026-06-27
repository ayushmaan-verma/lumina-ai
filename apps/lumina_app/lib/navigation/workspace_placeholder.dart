import 'package:flutter/material.dart';
import 'package:lumina_design/lumina_design.dart';

/// Lumina AI — Workspace Canvas Placeholder.
///
/// A production-quality placeholder displayed in the canvas area across all
/// adaptive layouts until Phase 5 implements the real Workspace Canvas.
///
/// Must look polished and intentional — not like an empty or unfinished screen.
/// Every design value originates from LSDS tokens.
///
/// Phase 5: Replace this widget with the real `WorkspaceCanvas`.
class WorkspacePlaceholder extends StatelessWidget {
  const WorkspacePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: AppSpacing.paddingXxl,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const _AnimatedBrandOrb(),
              const SizedBox(height: AppSpacing.xxl),
              Semantics(
                header: true,
                child: Text(
                  'Lumina AI',
                  style: AppTypography.heading1,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Your AI Workspace',
                style: AppTypography.subtitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'The application shell is running successfully.\n'
                'Workspace features will be available in a future milestone.',
                style: AppTypography.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xxl),
              const _ShellStatusBadge(),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Animated Brand Orb
// ---------------------------------------------------------------------------

/// Pulsing radial gradient orb representing the Lumina brand.
///
/// Uses [AppDurations.slow] and [AppCurves.standard] from LSDS motion tokens.
/// Respects reduced-motion preferences via [MediaQuery.disableAnimations].
class _AnimatedBrandOrb extends StatefulWidget {
  const _AnimatedBrandOrb();

  @override
  State<_AnimatedBrandOrb> createState() => _AnimatedBrandOrbState();
}

class _AnimatedBrandOrbState extends State<_AnimatedBrandOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.slow,
    );
    _pulse = CurvedAnimation(parent: _controller, curve: AppCurves.standard);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Respect the platform's reduced-motion accessibility setting.
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    if (reduceMotion) {
      _controller.stop();
    } else {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulse,
      builder: (_, __) => Container(
        width: AppSpacing.s96 + (_pulse.value * AppSpacing.lg),
        height: AppSpacing.s96 + (_pulse.value * AppSpacing.lg),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const RadialGradient(
            colors: [AppColors.primary, AppColors.glowPrimary],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.glowPrimary,
              blurRadius: AppSpacing.xxl + (_pulse.value * AppSpacing.xl),
              spreadRadius: AppSpacing.xs,
            ),
          ],
        ),
        child: const Icon(
          Icons.auto_awesome_outlined,
          size: AppIconSizes.xl,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shell Status Badge
// ---------------------------------------------------------------------------

/// Phase indicator badge shown in the placeholder canvas.
///
/// Communicates to developers and reviewers that the shell is active
/// and this area will be replaced by the Workspace Canvas in Phase 5.
class _ShellStatusBadge extends StatelessWidget {
  const _ShellStatusBadge();

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      recipe: GlassRecipe.card,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppSpacing.xs,
            height: AppSpacing.xs,
            decoration: const BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: AppSpacing.xs),
          Text(
            'Phase 3.1 — Application Shell Active',
            style: AppTypography.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
