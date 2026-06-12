import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/features/profile/data/menu_data.dart';
import 'package:skill_swap/features/profile/data/states_data.dart';
import 'package:skill_swap/features/profile/presentation/widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final states = StatesData.states;
    final   menus = MenuData.menus;
    return Scaffold(
      body: Column(
        children: [
          ProfileHeader(states: states),

          Expanded(
            child: ListView.builder(
              itemCount: menus.length,
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              itemBuilder: (context, index) {
                final menu = menus[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding,
                    vertical: AppSpacing.xs,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colors.outline.withValues(alpha: 0.5),
                      ),
                      borderRadius: AppRadius.mdRadius,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(
                            color: menu.color.withValues(alpha: 0.2),
                            borderRadius: AppRadius.mdRadius,
                          ),
                          child: Icon(
                            menu.icon,
                            color: menu.color,
                            size: AppSizes.iconMd,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Text(menu.label, style: context.appTextTheme.labelMedium),
                        const Spacer(),
                        const Icon(CupertinoIcons.forward),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
