import 'package:flutter/material.dart';
import '../adaptive/adaptive_spacing.dart';

class AdaptivePadding extends StatelessWidget {
  const AdaptivePadding({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final spacing = AdaptiveSpacing.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacing.pagePadding),
      child: child,
    );
  }
}
