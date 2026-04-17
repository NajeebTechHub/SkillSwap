import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,

    // basic
    this.hint,
    this.label,

    // icons
    this.prefixIcon,
    this.suffixIcon,

    // behavior
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,

    // input
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onTap,

    // styles
    this.textStyle,
    this.hintStyle,
    this.labelStyle,

    // colors
    this.fillColor,
    this.focusColor,
    this.errorColor,
    this.borderColor,
    this.cursorColor,

    // layout
    this.contentPadding,
    this.borderRadius = 12,

    // border types
    this.filled = true,
    this.outlined = false,

    // advanced
    this.maxLines = 1,
    this.minLines,
  });

  final TextEditingController controller;

  final String? hint;
  final String? label;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool obscureText;
  final bool readOnly;
  final bool enabled;

  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;
  final String? Function(String)? onChanged;
  final VoidCallback? onTap;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  final Color? fillColor;
  final Color? focusColor;
  final Color? errorColor;
  final Color? borderColor;
  final Color? cursorColor;

  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;

  final bool filled;
  final bool outlined;

  final int maxLines;
  final int? minLines;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final _fillColor = fillColor ?? theme.onSurfaceVariant.withValues(alpha: 0.1);
    final _focusColor = focusColor ?? theme.primary;
    final _errorColor = errorColor ?? theme.error;
    final _borderColor = borderColor ?? theme.outline;

    OutlineInputBorder _border(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: outlined
            ? BorderSide(color: color, width: width)
            : BorderSide.none,
      );
    }

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      maxLines: maxLines,
      minLines: minLines,
      cursorColor: cursorColor ?? theme.primary,
      style: textStyle,

      decoration: InputDecoration(
        hintText: hint,
        labelText: label,

        hintStyle: hintStyle,
        labelStyle: labelStyle,

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        filled: filled,
        fillColor: filled ? _fillColor : null,

        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

        border: _border(_borderColor),

        enabledBorder: _border(_borderColor),

        focusedBorder: _border(_focusColor, width: 1.5),

        errorBorder: _border(_errorColor),

        focusedErrorBorder: _border(_errorColor, width: 1.5),

        disabledBorder: _border(theme.onSurface.withValues(alpha: 0.2)),
      ),
    );
  }
}