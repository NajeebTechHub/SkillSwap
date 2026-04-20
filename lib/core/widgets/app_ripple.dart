import 'package:flutter/material.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/theme/app_colors.dart';

class AppRipple extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius borderRadius;

  const AppRipple({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
        ),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          splashColor: context.colors.onSurface.withValues(alpha: 0.1),
          highlightColor: context.colors.onSurface.withValues(alpha: 0.05),
          child: child,
        ),
      ),
    );
  }
}