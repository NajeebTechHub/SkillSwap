import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';

class StateCard extends StatelessWidget {
  final String label;
  final int? count;
  final double? rating;
  final IconData icon;
  const StateCard({super.key, required this.label, this.count, this.rating, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: context.colors.outline.withValues(alpha: 0.3),
        borderRadius: AppRadius.mdRadius,
      ),
      child: Column(
        children: [
          Icon(icon,color: context.colors.primary,),
          const SizedBox(height: AppSpacing.sm,),
          if(count != null)
            Text(count.toString(),style: context.appTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),),
          if(rating != null)
            Text(rating.toString(),style: context.appTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),),
          const SizedBox(height: AppSpacing.xs,),
          Text(label,style: context.appTextTheme.labelMedium,),

        ],
      ),

    );
  }
}
