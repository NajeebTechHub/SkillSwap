import 'package:flutter/material.dart';

class CategoryModel {
  final IconData? icon;
  final String name;
  final Color color;

  const CategoryModel({
    required this.icon,
    required this.name,
    required this.color
  });

  CategoryModel copyWith({
    IconData? icon,
    String? name,
    Color? color
  }) {
    return CategoryModel(
      icon: icon ?? this.icon,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }
}