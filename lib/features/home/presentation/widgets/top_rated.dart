import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/widgets/app_image.dart';
import 'package:skill_swap/features/home/models/mentor_model.dart';

class TopRated extends StatelessWidget {
  final List<MentorModel> featuredMentors;
  const TopRated({super.key, required this.featuredMentors});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.md,
        childAspectRatio: 0.64,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(featuredMentors.length, (index) {
          final mentor = featuredMentors[index];
          return Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              borderRadius: AppRadius.xlRadius,
              border: Border.all(color: context.colors.outline),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: AppImage(
                    imageUrl: mentor.image,
                    borderRadius: AppRadius.lgRadius,
                  ),
                ),

                const SizedBox(height: AppSpacing.md),

                Text(
                  mentor.name*5,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.appTextTheme.labelLarge,
                ),

                const SizedBox(height: AppSpacing.xs),

                Text(
                  mentor.role,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.appTextTheme.labelMedium,
                ),

                const SizedBox(height: AppSpacing.sm),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '⭐${mentor.rating}',
                      style: context.appTextTheme.labelMedium,
                    ),
                    const Spacer(),

                    Text('\$${mentor.price}/hr',
                      style: context.appTextTheme.labelMedium?.copyWith(color: context.colors.primary),),
                  ],
                ),
              ],
            ),
          );
        },
        )
    );
  }
}
