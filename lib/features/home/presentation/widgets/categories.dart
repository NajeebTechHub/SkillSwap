import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/widgets/app_icon.dart';
import 'package:skill_swap/features/home/models/categories_model.dart';

class Categories extends StatelessWidget {
  final List<CategoryModel> categories;
  const Categories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.zero,
        children: List.generate(categories.length, (index) {
          final category = categories[index];
          return Container(
            decoration: BoxDecoration(
              color: context.colors.outline.withValues(alpha: 0.2),
              borderRadius: AppRadius.mdRadius
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.sm),
                    decoration: BoxDecoration(
                      color: category.color.withValues(alpha: 0.1),
                      borderRadius: AppRadius.mdRadius
                    ),
                    child: AppIcon(
                      icon: category.icon,
                      color: category.color,
                      size: AppSizes.iconLg,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(category.name)
              ],
            ),
          );
        })
      );
  }
}
