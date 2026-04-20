import 'dart:ui';

import 'package:flutter/cupertino.dart';

class NotificationModel {
  final String id;
  final String type;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String message;
  final String time;
  final bool unread;


  NotificationModel({
   required this.id,
   required this.type,
   required this.icon,
   required this.iconColor,
   required this.title,
   required this.message,
   required this.time,
   required this.unread
});


  NotificationModel copyWith({
    String? id,
    String? type,
    IconData? icon,
    Color? iconColor,
    String? title,
    String? message,
    String? time,
    bool? unread
}){
    return NotificationModel(
      id: id ?? this.id,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,
      title: title ?? this.title,
      message: message ?? this.message,
      time: time ?? this.time,
      unread: unread ?? this.unread,
    );
  }
}