import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/router/route_names.dart';
import 'package:skill_swap/core/widgets/app_image.dart';
import 'package:skill_swap/core/widgets/app_ripple.dart';
import 'package:skill_swap/features/home/models/mentor_model.dart';

class FeaturedMentors extends StatelessWidget {
  final List<MentorModel> featuredMentors;
  const FeaturedMentors({super.key, required this.featuredMentors});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3,(index){
        final mentor = featuredMentors[index];
        return Padding(
          padding: index == 2
              ? EdgeInsets.zero
              : const EdgeInsets.only(bottom: AppSpacing.md),
          child: AppRipple(
            onTap: (){
              context.push('${RouteNames.mentorDetails}/${mentor.id}',);
            },
            borderRadius: AppRadius.xlRadius,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                borderRadius: AppRadius.xlRadius,
                border: Border.all(color: context.colors.outline)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppImage(imageUrl: mentor.image,height: AppSizes.imageMd,width: AppSizes.imageMd,borderRadius: AppRadius.lgRadius,),
                  const SizedBox(width: AppSpacing.md,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(mentor.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.appTextTheme.labelLarge,),
                        const SizedBox(height: AppSpacing.xs,),
                        Text(mentor.role,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: context.appTextTheme.labelMedium,),
                        const SizedBox(height: AppSpacing.sm,),
                        Text('⭐${mentor.rating} (${mentor.reviews} reviews)',style: context.appTextTheme.labelMedium,),
                      ],
                    ),
                  ),
                  // const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: context.colors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(AppSpacing.sm),
                        ),
                        child: Text('\$${mentor.price}/hr'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
