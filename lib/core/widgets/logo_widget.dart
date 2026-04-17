import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/constants/app_assets.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';

class LogoWidget extends StatelessWidget {

  const LogoWidget({super.key, this.size = AppSizes.logoSm, this.color});
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: size,
        height: size,
        padding: const EdgeInsets.all(AppSpacing.xs),
        decoration: BoxDecoration(
          color: color ?? context.colors.onSurface,
          borderRadius: AppRadius.mdRadius,
        ),
        child: Image.asset(AppAssets.logo)
    );
  }
}
