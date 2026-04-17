import 'package:flutter/cupertino.dart';

class AppConstraints {
  static const BoxConstraints logo = BoxConstraints(
    minWidth: 64,
    minHeight: 64,
    maxWidth: 200,
    maxHeight: 200,
  );

  static const BoxConstraints button = BoxConstraints(
    minHeight: 48,
    maxHeight: 56,
  );

  static const BoxConstraints image = BoxConstraints(
    minWidth: 120,
    minHeight: 120,
    maxWidth: 300,
    maxHeight: 300,
  );
}