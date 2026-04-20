import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/features/home/data/reviews_data.dart';

class Reviews extends StatelessWidget {
  final String mentorId;
  const Reviews({super.key, required this.mentorId});

  @override
  Widget build(BuildContext context) {
    final mentorReviews = ReviewsData.review
        .where((r) => r.mentorId == mentorId)
        .toList();

    if (mentorReviews.isEmpty) {
      return const Center(
        child: Text('No reviews yet'),
      );
    }

    return ListView.separated(
        itemCount: mentorReviews.length,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
          final review = mentorReviews[index];

          return Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration:  BoxDecoration(
              color: context.colors.outline.withValues(alpha: 0.3),
              borderRadius: AppRadius.mdRadius
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          context.colors.primary,
                          context.colors.secondary,
                        ],
                      ),

                      borderRadius: AppRadius.circleRadius,
                    ),
                    child: Text(review.userAvatar,style: context.appTextTheme.labelMedium?.copyWith(color: context.colors.surface),)
                ),
                const SizedBox(width: AppSpacing.md,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(review.userName,style: context.appTextTheme.titleMedium,),
                      const SizedBox(height: AppSpacing.xs,),
                      Text('${review.createdAt.day}/${review.createdAt.month}/${review.createdAt.year}',style: context.appTextTheme.labelSmall),
                      const SizedBox(height: AppSpacing.xs,),

                      Text(review.comment,style: context.appTextTheme.labelMedium,),
                    ],
                  ),
                ),
                Text('⭐${review.rating.toString()}',style: context.appTextTheme.labelMedium,),
              ],
            ),
          );
        },
        separatorBuilder: (_,_) => const SizedBox(height: AppSpacing.md),);
  }
}
