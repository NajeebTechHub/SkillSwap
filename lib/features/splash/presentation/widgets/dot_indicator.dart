import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/constants/app_durations.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.length, required this.currentIndex});
  final int length;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index){
        final isActive = index == currentIndex;

        return AnimatedContainer(
            duration: AppDurations.normal,
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
            height: AppSizes.iconXs,
            width: isActive ? AppSizes.iconMd : AppSizes.iconXs,
            decoration: BoxDecoration(
              color: isActive ? context.colors.primary : context.colors.onSurfaceVariant,
              borderRadius: AppRadius.smRadius,
            ),
        );
      }),
    );
  }
}
