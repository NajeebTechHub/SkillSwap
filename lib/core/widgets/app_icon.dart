import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum IconType { svgAsset, svgNetwork, imageAsset, imageNetwork, Object, file }

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,

    // source
    this.path,
    this.icon,
    this.file,
    this.type,

    // layout
    this.size = 24,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,

    // style
    this.color,
    this.backgroundColor,
    this.padding,
    this.borderRadius,

    // states
    this.isDisabled = false,
    this.opacity,

    // fallback
    this.errorWidget,
  });

  final String? path;
  final IconData? icon;
  final File? file;
  final IconType? type;

  final double size;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;

  final Color? color;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  final bool isDisabled;
  final double? opacity;

  final Widget? errorWidget;

  bool get _isSvg => path?.endsWith('.svg') ?? false;
  bool get _isNetwork => path?.startsWith('http') ?? false;

  @override
  Widget build(BuildContext context) {
    Widget child;

    /// 🔹 1. ICON DATA (Material / Cupertino)
    if (icon != null) {
      child = Icon(
        icon,
        size: size,
        color: _getColor(context),
      );
    }

    /// 🔹 2. FILE IMAGE
    else if (file != null) {
      child = Image.file(
        file!,
        width: width ?? size,
        height: height ?? size,
        fit: fit,
        errorBuilder: (_, __, ___) => _error(),
      );
    }

    /// 🔹 3. NETWORK
    else if (_isNetwork) {
      if (_isSvg) {
        child = SvgPicture.network(
          path!,
          width: width ?? size,
          height: height ?? size,
          fit: fit,
          colorFilter: _colorFilter(),
          placeholderBuilder: (_) => _loader(),
        );
      } else {
        child = Image.network(
          path!,
          width: width ?? size,
          height: height ?? size,
          fit: fit,
          errorBuilder: (_, __, ___) => _error(),
        );
      }
    }

    /// 🔹 4. ASSET
    else if (path != null) {
      if (_isSvg) {
        child = SvgPicture.asset(
          path!,
          width: width ?? size,
          height: height ?? size,
          fit: fit,
          colorFilter: _colorFilter(),
        );
      } else {
        child = Image.asset(
          path!,
          width: width ?? size,
          height: height ?? size,
          fit: fit,
          errorBuilder: (_, __, ___) => _error(),
        );
      }
    }

    /// 🔹 5. FALLBACK
    else {
      child = _error();
    }

    /// 🔹 6. OPTIONAL STYLING WRAPPER
    if (padding != null || backgroundColor != null || borderRadius != null) {
      child = Container(
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        child: child,
      );
    }

    /// 🔹 7. DISABLED / OPACITY STATE
    if (isDisabled || opacity != null) {
      child = Opacity(
        opacity: opacity ?? 0.4,
        child: child,
      );
    }

    return Align(
      alignment: alignment,
      child: SizedBox(
        width: width ?? size,
        height: height ?? size,
        child: child,
      ),
    );
  }

  /// 🎨 Color logic
  Color? _getColor(BuildContext context) {
    if (isDisabled) return Colors.grey;
    return color ?? Theme.of(context).iconTheme.color;
  }

  ColorFilter? _colorFilter() {
    if (color == null) return null;
    return ColorFilter.mode(color!, BlendMode.srcIn);
  }

  /// ⏳ Loader
  Widget _loader() {
    return const Center(
      child: SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

  /// ❌ Error fallback
  Widget _error() {
    return errorWidget ??
        const Icon(
          Icons.broken_image,
          size: 20,
          color: Colors.grey,
        );
  }
}