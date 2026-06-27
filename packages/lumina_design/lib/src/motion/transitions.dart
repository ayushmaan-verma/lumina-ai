import 'package:flutter/material.dart';
import 'motion_tokens.dart';

abstract final class LuminaTransitions {
  static Widget fadeSlide({
    required Animation<double> animation,
    required Widget child,
  }) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: MotionTokens.pageTransitionCurve,
      ),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.02),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: MotionTokens.pageTransitionCurve,
          ),
        ),
        child: child,
      ),
    );
  }

  static Widget fade({
    required Animation<double> animation,
    required Widget child,
  }) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: MotionTokens.modalCurve,
      ),
      child: child,
    );
  }

  static Widget fadeScale({
    required Animation<double> animation,
    required Widget child,
  }) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: MotionTokens.modalCurve,
      ),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.96, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: MotionTokens.modalCurve,
          ),
        ),
        child: child,
      ),
    );
  }
}
