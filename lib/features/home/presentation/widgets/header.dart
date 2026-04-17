import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/widgets/app_text_field.dart';

class Header extends StatelessWidget {

  const Header({super.key, required this.searchController});
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
                    'Hi, Najeeb Anjum 👋',
                    style: context.appTextTheme.headlineSmall,
                  ),
                  Text(
                    'Find your perfect mentor',
                    style: TextStyle(color: context.colors.onSurfaceVariant),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [context.colors.primary, context.colors.secondary],
                  ),
                  borderRadius: AppRadius.circleRadius,
                ),
                child: Text(
                  'NJ',
                  style: context.appTextTheme.titleSmall?.copyWith(
                    color: context.colors.surface,
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
