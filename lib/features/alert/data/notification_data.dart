import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/theme/app_colors.dart';
import 'package:skill_swap/features/alert/models/notification_model.dart';

class NotificationData {
  static final notifications = [
    NotificationModel(
      id: '1',
      type: 'booking',
      icon: Icons.check_circle_outline,
      iconColor: AppColors.success,
      title: 'Booking Confirmed',
      message: 'Your session with Sarah Johnson is confirmed for April 14 at 10:00 AM',
      time: '5m ago',
      unread: true,
    ),
    NotificationModel(
      id: '2',
      type: 'message',
      icon: CupertinoIcons.chat_bubble,
      iconColor: AppColors.blue600,
      title: 'New Message',
      message: 'Michael Chen sent you a message: "Looking forward to our session!"',
      time: '1h ago',
      unread: true,
    ),
    NotificationModel(
      id: '3',
      type: 'reminder',
      icon: CupertinoIcons.clock,
      iconColor: AppColors.orange600,
      title: 'Session Reminder',
      message: 'Your session with Emily Rodriguez starts in 2 hours',
      time: '2h ago',
      unread: false,
    ),
    NotificationModel(
      id: '4',
      type: 'review',
      icon: CupertinoIcons.star,
      iconColor: AppColors.purple100,
      title: 'Review Request',
      message: 'How was your session with Alex Thompson? Leave a review',
      time: '1d ago',
      unread: false,
    ),
    NotificationModel(
      id: '5',
      type: 'promotion',
      icon: CupertinoIcons.gift,
      iconColor: AppColors.pink600,
      title: 'Special Offer',
      message: 'Get 20% off your next booking with code SKILL20',
      time: '2d ago',
      unread: false,

    ),
    NotificationModel(
      id: '6',
      type: 'achievement',
      icon: Icons.trending_up,
      iconColor: AppColors.purple600,
      title: 'Milestone Reached',
      message: 'Congratulations! You\'ve completed 10 sessions on SkillSwap',
      time: '3d ago',
      unread: false,
    ),
  ];
}