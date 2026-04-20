import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/widgets/app_button.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [context.colors.primary.withValues(alpha: 0.1), context.colors.secondary.withValues(alpha: 0.1)])
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppString.profile,style: context.appTextTheme.headlineSmall,),
              IconButton(onPressed: (){}, icon: const Icon(Icons.settings))
            ],
          ),
          const SizedBox(height: AppSpacing.md,),
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: AppRadius.mdRadius,
              border: Border.all(color: context.colors.outline.withValues(alpha: 0.5))
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.md),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [context.colors.primary, context.colors.secondary]),
                              borderRadius: AppRadius.circleRadius
                          ),
                          child: Text('NJ',style: context.appTextTheme.titleSmall?.copyWith(color: context.colors.surface),),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: (){},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: context.colors.primary,
                                  borderRadius: AppRadius.circleRadius
                                ),
                                padding: const EdgeInsets.all(AppSpacing.xs),
                                child: Icon(Icons.edit,size: AppSizes.iconXs,color: context.colors.surface,),

                              ),
                            ))
                      ],
                    ),
                    const SizedBox(width: AppSpacing.md,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Najeeb Anjum',style: context.appTextTheme.titleMedium,),
                        const SizedBox(height: AppSpacing.xs,),
                        Text('najeeb@gmail.com',style: context.appTextTheme.labelMedium,)
                      ],
                    ),

                  ],
                ),
                const SizedBox(height: AppSpacing.md,),

                AppButton(
                    text: 'Edit Profile',
                    textColor: context.colors.onSurface,
                    backgroundColor: context.colors.surface,
                    borderColor: context.colors.secondary,
                    splashColor: context.colors.secondary,
                    highlightColor: context.colors.secondary,
                    onPressed: (){})
              ],
            ),
          )
        ],
      ),
    );
  }
}
