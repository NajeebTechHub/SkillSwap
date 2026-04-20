import 'package:flutter/material.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';

class AppButton extends StatelessWidget {

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.height = 42,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.borderRadius = 12,
    this.outlined = false,
    this.borderColor,
    this.splashColor,
    this.highlightColor,
  });
  final String text;
  final VoidCallback? onPressed;

  final bool isLoading;
  final bool isDisabled;

  final double height;
  final double? width;

  final Color? backgroundColor;
  final Color? textColor;

  final Widget? icon;
  final double borderRadius;

  final bool outlined;
  final Color? borderColor;

  final Color? splashColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    final baseBg = backgroundColor ?? context.colors.primary;

    final bgColor = isDisabled
        ? context.colors.onSurfaceVariant
        : outlined
        ? backgroundColor ?? Colors.transparent
        : baseBg;

    final txtColor = textColor ??
        (outlined
            ? context.colors.primary
            : context.colors.onPrimary);

    final rippleBase = outlined
        ? context.colors.outline
        : context.colors.onSurface;

    return SizedBox(
      width: width ?? double.infinity,
      height: height,

      child: Material(
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: outlined
              ? BorderSide(
            color: borderColor ?? context.colors.primary,
            width: 1.5,
          )
              : BorderSide.none,
        ),

        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),

          splashColor:
          splashColor ?? rippleBase,

          highlightColor:
          highlightColor ?? rippleBase,

          onTap: (isLoading || isDisabled)
              ? null
              : onPressed,

          child: Center(
            child: isLoading
                ? SizedBox(
              height: 18,
              width: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor:
                AlwaysStoppedAnimation(txtColor),
              ),
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 8),
                ],
                Text(
                  text,
                  style: context.appTextTheme.bodyMedium?.copyWith(
                    color: txtColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}