import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppImage extends StatelessWidget {

  const AppImage({
    super.key,
    this.imageUrl,
    this.assetPath,
    this.file,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.onTap,
  });
  final String? imageUrl;
  final String? assetPath;
  final File? file;

  final double? height;
  final double? width;
  final BoxFit fit;

  final BorderRadius? borderRadius;

  final Widget? placeholder;
  final Widget? errorWidget;

  final VoidCallback? onTap;

  bool get _isNetworkImage =>
      imageUrl != null && imageUrl!.isNotEmpty;

  bool get _isAssetImage =>
      assetPath != null && assetPath!.isNotEmpty;

  bool get _isFileImage => file != null;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (_isNetworkImage) {
      imageWidget = CachedNetworkImage(
        imageUrl: imageUrl!,
        height: height,
        width: width,
        fit: fit,
        placeholder: (context, url) =>
        placeholder ?? _defaultLoader(),
        errorWidget: (context, url, error) =>
        errorWidget ?? _defaultError(),
      );
    } else if (_isFileImage) {
      imageWidget = Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (_, _, _) =>
        errorWidget ?? _defaultError(),
      );
    } else if (_isAssetImage) {
      imageWidget = Image.asset(
        assetPath!,
        height: height,
        width: width,
        fit: fit,
        errorBuilder: (_, _, _) =>
        errorWidget ?? _defaultError(),
      );
    } else {
      imageWidget = errorWidget ?? _defaultError();
    }

    if (borderRadius != null) {
      imageWidget = ClipRRect(
        borderRadius: borderRadius!,
        child: imageWidget,
      );
    }

    if (onTap != null) {
      imageWidget = GestureDetector(
        onTap: onTap,
        child: imageWidget,
      );
    }

    return imageWidget;
  }

  Widget _defaultLoader() {
    return const Center(
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }

  Widget _defaultError() {
    return Container(
      color: Colors.grey.shade200,
      child: const Icon(
        Icons.broken_image,
        color: Colors.grey,
      ),
    );
  }
}