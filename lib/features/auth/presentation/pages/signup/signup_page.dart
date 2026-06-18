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

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agreeToTerms = false;
  bool _obscureText = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onSignUp()async{
    if(!_formKey.currentState!.validate()) return;

    if(!_agreeToTerms){
      AppToast.showToast(message: 'Please agree to terms & conditions');
      return;
    }

    final controller = context.read<AuthController>();
    final success = await controller.signUp(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim()
    );

    if(!mounted) return;

    if(!success){
      AppToast.showToast(message: controller.errorMessage ?? 'Sign up failed');
    }

    context.go(RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthController>().isLoading;

    return Scaffold(
      appBar: AppBar(
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppString.alreadyHaveAccount),
            TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: (){
                  context.go(RouteNames.login);
                }, child: const Text(AppString.signIn))
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
              // SizedBox(height: AppSpacing.xxxl,),
              Row(
                children: [
                  const LogoWidget(size: AppSizes.logoMd,),
                  const SizedBox(width: AppSpacing.md,),
                  Text(AppString.createAccount,style: context.appTextTheme.headlineMedium,)
                ],
              ),
              const SizedBox(height: AppSpacing.md,),
              Text(AppString.joinSkillSwap,style: context.appTextTheme.labelLarge,),
              const SizedBox(height: AppSpacing.lg,),
              Text(AppString.fullName,style: context.appTextTheme.labelLarge,),
              const SizedBox(height: AppSpacing.xs,),
              AppTextField(
                controller: _nameController, hint: 'Enter your full name',
                validator: (v) => FormValidators.validateRequiredFields(v),
              ),
              const SizedBox(height: AppSpacing.md,),
              Text(AppString.email,style: context.appTextTheme.labelLarge,),
              const SizedBox(height: AppSpacing.xs,),
              AppTextField(
                controller: _emailController,hint: 'your.email@example.com',
                validator: (v) => FormValidators.validateEmail(v),
              ),
              const SizedBox(height: AppSpacing.md,),
              Text(AppString.password,style: context.appTextTheme.labelLarge,),
              const SizedBox(height: AppSpacing.xs,),
              AppTextField(
                controller: _passwordController, hint: 'your password',
                obscureText: _obscureText,
                suffixIcon: IconButton(onPressed: (){
                  setState(() {
                    _obscureText =! _obscureText;
                  });
                }, icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility)),
                validator: (v) => FormValidators.validateStrongPassword(v),
              ),
              const SizedBox(height: AppSpacing.lg,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      visualDensity: VisualDensity.compact,
                      value: _agreeToTerms, onChanged: (value){
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  }),
                  // SizedBox(width: AppSpacing.xs,),
                  Text(AppString.agreeToTerms,style: context.appTextTheme.labelMedium?.copyWith(color: context.colors.onSurfaceVariant),),
                ],
              ),
              const SizedBox(height: AppSpacing.sm,),
              AppButton(text: AppString.createAccount,isLoading: isLoading, onPressed: isLoading ? null : _onSignUp),
              const SizedBox(height: AppSpacing.xl,),
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                    child: Text(AppString.orContinueWith,style: context.appTextTheme.labelMedium?.copyWith(color: context.colors.onSurfaceVariant),),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: AppSpacing.sm,),
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
          )),
        ),
      ),
    );
  }
}
