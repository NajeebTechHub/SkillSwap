import 'package:flutter/cupertino.dart';

class MenuModel {
  final String label;
  final IconData icon;
  final Color color;

  MenuModel({
    required this.label,
    required this.icon,
    required this.color
});

  MenuModel copyWith({
    String? title,
    IconData? icon,
    Color? color
}){
    return MenuModel(
        label: title ?? this.label,
        icon: icon ?? this.icon,
        color: color ?? this.color
    );
  }
}