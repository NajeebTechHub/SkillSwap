import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/router/route_names.dart';
import 'package:skill_swap/core/widgets/app_button.dart';
import 'package:skill_swap/core/widgets/app_image.dart';
import 'package:skill_swap/features/home/models/mentor_model.dart';
import 'package:skill_swap/features/home/presentation/widgets/reviews.dart';
import 'package:skill_swap/features/home/presentation/widgets/state_card.dart';

class MentorDetailsPage extends StatelessWidget {
  final MentorModel featuredMentors;
  const MentorDetailsPage({super.key, required this.featuredMentors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: context.colors.surface),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.chat_outlined))
        ],

      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: context.colors.outline)),
          ),
          child: AppButton(text: AppString.bookSession, onPressed: (){
            context.push('${RouteNames.bookSession}/${featuredMentors.id}');
          })),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: AppImage(
              imageUrl: featuredMentors.image,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(featuredMentors.name,style: context.appTextTheme.titleLarge,),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm,vertical: AppSpacing.xs),
                        decoration: BoxDecoration(
                          color: context.colors.primary,
                          borderRadius: AppRadius.smRadius,
                        ),
                        child: Text('\$${featuredMentors.price}/hr',style: context.appTextTheme.labelLarge?.copyWith(color: context.colors.surface),),
                      ),
                    ],
                  ),
                  Text(featuredMentors.role,style: context.appTextTheme.labelMedium,),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('⭐${featuredMentors.rating} (${featuredMentors.reviews})'),
                      Text('📍${featuredMentors.location}'),
                      Text('💼${featuredMentors.experience}+ years'),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Text(AppString.about,style: context.appTextTheme.titleMedium,),
                  const SizedBox(height: AppSpacing.md),
                  Text(featuredMentors.about,style: context.appTextTheme.labelMedium,),
                  const SizedBox(height: AppSpacing.xl),
                  Text(AppString.expertise,style: context.appTextTheme.titleMedium,),
                  const SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.md,
                    children: List.generate(featuredMentors.expertise.length, (index) {
                      final expertise = featuredMentors.expertise[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm,vertical: AppSpacing.xs),
                        decoration: BoxDecoration(
                          color: context.colors.primary.withValues(alpha: 0.1),
                        ),
                        child: Text(expertise,style: context.appTextTheme.labelMedium?.copyWith(color: context.colors.primary),),
                      );
                    }
                  )),
                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    children: [
                      Expanded(child: StateCard(label: AppString.students,count: featuredMentors.students, icon: Icons.school,)),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(child: StateCard(label: AppString.hours,count: featuredMentors.hours, icon: Icons.lock_clock,)),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(child: StateCard(label: AppString.rating,rating: featuredMentors.rating, icon: Icons.star,)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Text('🎓 ${AppString.education}',style: context.appTextTheme.titleMedium,),
                  const SizedBox(height: AppSpacing.md),
                  Text(featuredMentors.education,style: context.appTextTheme.labelMedium,),
                  const SizedBox(height: AppSpacing.xl),
                  Text(AppString.languages,style: context.appTextTheme.titleMedium,),
                  const SizedBox(height: AppSpacing.md),
                  Text(featuredMentors.languages.join(', '),style: context.appTextTheme.labelMedium,),
                  const SizedBox(height: AppSpacing.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${AppString.reviews} (${featuredMentors.reviews})',style: context.appTextTheme.titleMedium,),
                      TextButton(
                          style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap
                          ),
                          onPressed: (){}, child: const Text(AppString.seeAll))
                    ],
                  ),
                  Reviews(mentorId: featuredMentors.id),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
