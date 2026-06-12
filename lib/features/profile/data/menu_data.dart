import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/theme/app_colors.dart';
import 'package:skill_swap/features/profile/models/menu_model.dart';

class MenuData {
  static final menus = [
    MenuModel(
        label: 'Booking History',
        icon: CupertinoIcons.calendar,
        color: AppColors.blue600
    ),
    MenuModel(
        label: 'My Reviews',
        icon: CupertinoIcons.star,
        color: AppColors.orange600
    ),
    MenuModel(
        label: 'Saved Mentors',
        icon: CupertinoIcons.heart,
        color: AppColors.pink600
    ),
    MenuModel(
        label: 'Payment Method',
        icon: CupertinoIcons.creditcard,
        color: AppColors.green600
    ),
    MenuModel(
        label: 'Settings',
        icon: CupertinoIcons.settings,
        color: AppColors.outline
    ),
    MenuModel(
        label: 'Help & Support',
        icon: CupertinoIcons.question_circle,
        color: AppColors.purple600
    ),
    MenuModel(
        label: 'Log Out',
        icon: Icons.logout,
        color: AppColors.error
    ),
  ];
}