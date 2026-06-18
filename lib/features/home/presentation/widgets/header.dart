import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/utils/helper/app_helper.dart';
import 'package:skill_swap/core/widgets/app_text_field.dart';
import 'package:skill_swap/features/profile/models/profile_model.dart';

class Header extends StatelessWidget {
  final ProfileModel profile;
  const Header({super.key, required this.searchController, required this.profile});
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 16),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.colors.primary.withValues(alpha: 0.1),
            context.colors.secondary.withValues(alpha: 0.1),
          ],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.lg),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, ${profile.name} 👋',
                    style: context.appTextTheme.headlineSmall,
                  ),
                  Text(
                    'Find your perfect mentor',
                    style: TextStyle(color: context.colors.onSurfaceVariant),
                  ),
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [context.colors.primary, context.colors.secondary],
                  ),
                  borderRadius: AppRadius.circleRadius,
                ),
                child: Center(
                  child: Text(
                    AppHelper.getInitials(profile.name),
                    style: context.appTextTheme.titleSmall?.copyWith(
                      color: context.colors.surface,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          AppTextField(
            controller: searchController,
            hint: 'Search for mentors, skills...',
            fillColor: context.colors.surface,
            prefixIcon: const Icon(CupertinoIcons.search),

          ),
        ],
      ),
    );
  }
}
