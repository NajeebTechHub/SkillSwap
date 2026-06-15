import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/app_root/app_state_provider.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/constants/app_durations.dart';
import 'package:skill_swap/core/router/route_names.dart';
import 'package:skill_swap/core/theme/app_colors.dart';
import 'package:skill_swap/core/widgets/app_image.dart';
import 'package:skill_swap/features/splash/presentation/widgets/dot_indicator.dart';
import 'package:skill_swap/features/onboarding/data/onboarding_data.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final slides = OnboardingData.slides;

  void next() async{
    if (currentIndex < slides.length - 1) {
      _controller.nextPage(
        duration: AppDurations.normal,
        curve: Curves.easeInOut,
      );
    } else {
      final appState = context.read<AppStateProvider>();

      await appState.storage.setOnboardingCompleted();

      appState.completeOnboarding();

      // context.go(RouteNames.login);
    }
  }

  void skip() async{
    final appState = context.read<AppStateProvider>();

    await appState.storage.setOnboardingCompleted();

    appState.completeOnboarding();

    // context.go(RouteNames.login);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.only(right: AppSpacing.screenPadding, top: AppRadius.sm),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  overlayColor: AppColors.transparent,
                ),
                onPressed: skip,
                child: Text(
                  AppString.skip,
                  style: context.appTextTheme.bodyMedium?.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: slides.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final slide = slides[index];

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.screenPadding,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: ClipRRect(
                                borderRadius: AppRadius.mdRadius,
                                child: AppImage(
                                  imageUrl: slide.image,
                                ),
                              ),
                            ),

                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: AppRadius.mdRadius,
                                  gradient: LinearGradient(
                                    colors: [
                                      slide.gradient.first.withValues(alpha: 0.3),
                                      slide.gradient.last.withValues(alpha: 0.3),
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                            ),

                            Positioned(
                              top: AppSpacing.md,
                              right: AppSpacing.md,
                              child: Container(
                                width: AppSizes.iconLg,
                                height: AppSizes.iconLg,
                                decoration: BoxDecoration(
                                  color: context.colors.onPrimary,
                                  borderRadius: AppRadius.mdRadius,
                                ),
                                child: const Icon(Icons.star),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: AppSpacing.md),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xxl,
                        ),
                        child: Column(
                          children: [
                            Text(
                              slide.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: context.appTextTheme.headlineMedium,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            Text(
                              slide.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: context.appTextTheme.bodyMedium?.copyWith(
                                color: context.colors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            const SizedBox(height: AppSpacing.lg),

            DotIndicator(currentIndex: currentIndex, length: slides.length),

            Padding(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              child: ElevatedButton(
                onPressed: next,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.mdRadius,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currentIndex == slides.length - 1
                          ? AppString.getStarted
                          : AppString.next,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
