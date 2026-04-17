import 'package:flutter/material.dart';
import 'package:skill_swap/core/theme/app_colors.dart';
import 'package:skill_swap/features/home/models/categories_model.dart';

class CategoriesData {
  static final categories = [
    const CategoryModel(icon: Icons.code, name: 'Development', color: AppColors.blue600,),
    const CategoryModel(icon: Icons.design_services, name: 'Design', color: AppColors.purple600),
    const CategoryModel(icon: Icons.business, name: 'Business',color: AppColors.green600),
    const CategoryModel(icon: Icons.analytics_outlined, name: 'Marketing',color: AppColors.orange600),
    const CategoryModel(icon: Icons.group_outlined, name: 'Career', color: AppColors.pink600),
    const CategoryModel(icon: Icons.videocam_outlined, name: 'Video',color: AppColors.red600),
    ];
}