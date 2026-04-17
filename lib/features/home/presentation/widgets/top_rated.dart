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
    return GridView.builder(
      itemCount: featuredMentors.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final mentor = featuredMentors[index];
        return Container(
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            borderRadius: AppRadius.xlRadius,
            border: Border.all(color: context.colors.outline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppImage(
                imageUrl: mentor.image,
                height: AppSizes.imageMd,
                width: AppSizes.imageMd,
                borderRadius: AppRadius.lgRadius,
              ),

              const SizedBox(height: AppSpacing.md),

              Text(
                mentor.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.appTextTheme.labelLarge,
              ),

              const SizedBox(height: AppSpacing.xs),

              Text(
                mentor.role,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.appTextTheme.labelMedium,
              ),

              const SizedBox(height: AppSpacing.sm),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${mentor.rating}',
                    style: context.appTextTheme.labelMedium,
                  ),

                  Text('\$${mentor.price}/hr',style: TextStyle(color: context.colors.primary),),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
