import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/widgets/app_button.dart';
import 'package:skill_swap/features/profile/models/states_model.dart';

class ProfileHeader extends StatelessWidget {
  final List<StatesModel> states;
  const ProfileHeader({super.key, required this.states});

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
              border: Border.all(color: context.colors.outline.withValues(alpha: 0.8))
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
                    outlined: true,
                    borderColor: context.colors.outline.withValues(alpha: 0.5),
                    splashColor: context.colors.secondary,
                    highlightColor: context.colors.secondary,
                    onPressed: (){})
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.xl,),

          Row(
            children: states.map((e) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: StateCard(
                    count: e.count,
                    label: e.label,
                  ),
                ),
              );
            }).toList(),
          )


        ],
      ),
    );
  }
}

class StateCard extends StatelessWidget {
  final int count;
  final String label;
  
  const StateCard({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: AppRadius.mdRadius,
        border: Border.all(color: context.colors.outline.withValues(alpha: 0.8))
      ),
      child: Column(
        children: [
          Text(count.toString(),style: context.appTextTheme.labelLarge,),
          const SizedBox(height: AppSpacing.sm,),
          Text(label,style: context.appTextTheme.labelSmall,)
        ],
      ),
    );
  }
}

