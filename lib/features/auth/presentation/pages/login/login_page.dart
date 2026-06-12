import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/utils/form_validators.dart';
import 'package:skill_swap/core/widgets/app_text_field.dart';
import 'package:skill_swap/core/widgets/app_toast.dart';
import 'package:skill_swap/core/widgets/logo_widget.dart';
import 'package:skill_swap/core/router/route_names.dart';
import 'package:skill_swap/core/widgets/app_button.dart';
import 'package:skill_swap/features/auth/presentation/controller/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onSignIn()async{
    if(!_formKey.currentState!.validate()) return;

    final controller = context.read<AuthController>();
    final success = await controller.signIn(_emailController.text.trim(), _passwordController.text.trim());

    if(!mounted) return;

    if(success) {
      context.go(RouteNames.home);
    }else{
      AppToast.showToast(message: controller.errorMessage ?? 'Sign in failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthController>().isLoading;

    return Scaffold(
      bottomNavigationBar: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppString.dontHaveAccount),
            TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: (){
                  context.push(RouteNames.signup);
                }, child: const Text(AppString.signUp))
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSpacing.xxxl,),
                Row(
                  children: [
                    const LogoWidget(size: AppSizes.logoMd,),
                    const SizedBox(width: AppSpacing.md,),
                    Text(AppString.skill + AppString.swap,style: context.appTextTheme.headlineMedium,)
                  ],
                ),
                const SizedBox(height: AppSpacing.md,),
                Text(AppString.welcomeBack,style: context.appTextTheme.labelLarge,),
                const SizedBox(height: AppSpacing.lg,),
                Text(AppString.email,style: context.appTextTheme.labelLarge,),
                const SizedBox(height: AppSpacing.xs,),
                AppTextField(controller: _emailController,hint: 'your.email@example.com',
                validator: (v) => FormValidators.validateEmail(v),
                ),
                const SizedBox(height: AppSpacing.md,),
                Text(AppString.password,style: context.appTextTheme.labelLarge,),
                const SizedBox(height: AppSpacing.xs,),
                AppTextField(controller: _passwordController, hint: 'your password',
                validator: (v) => FormValidators.validateRequiredFields(v),
                ),
                const SizedBox(height: AppSpacing.md,),
                Align(
                  alignment: Alignment.centerRight,
                  child:Text(AppString.forgotPassword,style: context.appTextTheme.labelLarge?.copyWith(color: context.colors.primary),),
                ),
                const SizedBox(height: AppSpacing.xxl,),
                AppButton(text: AppString.signIn,isLoading: isLoading, onPressed: isLoading ? null : _onSignIn),
                const SizedBox(height: AppSpacing.xl,),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                      child: Text(AppString.orContinueWith,style: context.appTextTheme.labelMedium?.copyWith(color: context.colors.onSurfaceVariant),),
                    ),
                    const Expanded(child: Divider())
                  ],
                ),
                const SizedBox(height: AppSpacing.xl,),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: AppString.google,
                        backgroundColor:  context.colors.surface,
                        textColor: context.colors.onSurface,
                        outlined: true,
                        splashColor: context.colors.secondary,
                        highlightColor: context.colors.secondary,
                        borderColor: context.colors.outline,
                        icon: FaIcon(FontAwesomeIcons.google,color: context.colors.onSurface,size: AppSizes.iconSm,),
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: AppButton(
                        text: AppString.facebook,
                        backgroundColor:  context.colors.surface,
                        textColor: context.colors.onSurface,
                        outlined: true,
                        splashColor: context.colors.secondary,
                        highlightColor: context.colors.secondary,
                        borderColor: context.colors.outline,
                        icon: FaIcon(FontAwesomeIcons.facebook,color: context.colors.onSurface,size: AppSizes.iconSm,),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
