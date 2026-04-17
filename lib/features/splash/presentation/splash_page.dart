import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_swap/core/constants/app_durations.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/router/route_names.dart';
import 'package:skill_swap/core/theme/app_colors.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/widgets/logo_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
        vsync: this,
        duration: AppDurations.pulseDuration)..repeat(reverse: true);

    _fadeAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
        CurvedAnimation(
            parent: _fadeController,
            curve: Curves.easeInOut
        )
    );

    Future.delayed(AppDurations.splashDelay,(){
      if(!mounted) return;
      context.go(RouteNames.onboarding);
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.accent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const LogoWidget(size: AppSizes.logoLg,),
                Positioned(
                    top: -AppSpacing.sm,
                    right: -AppSpacing.sm,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        width: AppSizes.iconMd,
                        height: AppSizes.iconMd,
                        decoration: BoxDecoration(
                          color: context.colors.secondary,
                          borderRadius: AppRadius.xlRadius,

                        ),
                      ),
                    ))
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Text.rich(
              TextSpan(
                text: AppString.skill,
                style: context.appTextTheme.titleLarge?.copyWith(color: AppColors.background),
                children: [
                  TextSpan(text: AppString.swap,style: context.appTextTheme.titleLarge?.copyWith(color: AppColors.background,))
                ]
              )
            ),
            const SizedBox(height: AppSpacing.md),
            Text(AppString.tagLine,style: context.appTextTheme.bodySmall?.copyWith(color: AppColors.background),)
          ],
        ),
      ),
    );
  }
}
