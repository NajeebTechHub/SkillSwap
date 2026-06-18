import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/router/route_names.dart';
import 'package:skill_swap/core/utils/form_validators.dart';
import 'package:skill_swap/core/widgets/app_button.dart';
import 'package:skill_swap/core/widgets/app_text_field.dart';
import 'package:skill_swap/core/widgets/app_toast.dart';
import 'package:skill_swap/features/post_skill/models/post_skill_model.dart';
import 'package:skill_swap/features/post_skill/presentation/controller/post_skill_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostSkillPage extends StatefulWidget {
  const PostSkillPage({super.key});

  @override
  State<PostSkillPage> createState() => _PostSkillPageState();
}

class _PostSkillPageState extends State<PostSkillPage> {
  String? selectedValue;
  String? type;
  String? level;
  
  final List<String> categories = ['Development', 'Design', 'Business','Marketing','Career', 'Video'];
  final List<String> types = ['I can teach', 'I want to learn',];
  final List<String> levels = ['Beginner', 'Intermediate', 'Expert',];

  final TextEditingController skillName = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController experience = TextEditingController();
  final TextEditingController about = TextEditingController();
  final TextEditingController price = TextEditingController();
  final _fomKey = GlobalKey<FormState>();

  @override
  void dispose() {

    selectedValue = null;
    type = null;
    level = null;
    skillName.dispose();
    location.dispose();
    experience.dispose();
    about.dispose();
    price.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Skill'),
        centerTitle: true,
        bottom: PreferredSize(preferredSize: const Size.fromHeight(AppSpacing.md), child: Divider(color: context.colors.outline,height: 0,)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        child: Form(
          key: _fomKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppString.category,style: context.appTextTheme.titleMedium,),
              const SizedBox(height: AppSpacing.xs,),
              CustomDropdown(value: selectedValue, items: categories,onChanged: (val) {
                setState(() {
                  selectedValue = val;
                });
              }),
              const SizedBox(height: AppSpacing.md,),
              Text(AppString.skillName,style: context.appTextTheme.titleMedium,),
              const SizedBox(height: AppSpacing.xs,),
              AppTextField(controller: skillName,hint: AppString.enterSkillName,validator: (v) => FormValidators.validateRequiredFields(v),),
              const SizedBox(height: AppSpacing.md,),
              Text(AppString.type,style: context.appTextTheme.titleMedium,),
              const SizedBox(height: AppSpacing.xs,),
              CustomDropdown(value: type, items: types,onChanged: (val){
                setState(() {
                  type = val;
                });
              }),
              const SizedBox(height: AppSpacing.md,),
              Text(AppString.level,style: context.appTextTheme.titleMedium,),
              const SizedBox(height: AppSpacing.xs,),
              CustomDropdown(value: level, items: levels,onChanged: (val){
                setState(() {
                  level = val;
                });
              }),
              const SizedBox(height: AppSpacing.md,),
              Text(AppString.location,style: context.appTextTheme.titleMedium,),
              const SizedBox(height: AppSpacing.xs,),
              AppTextField(controller: location, hint: AppString.yourLocation,validator: (v) => FormValidators.validateRequiredFields(v),),
              const SizedBox(height: AppSpacing.md,),
              Text(AppString.experience,style: context.appTextTheme.titleMedium,),
              const SizedBox(height: AppSpacing.xs,),
              AppTextField(controller: experience,hint: AppString.yourExperience,validator: (v) => FormValidators.validateRequiredFields(v),),
              const SizedBox(height: AppSpacing.md,),
              Text(AppString.about,style: context.appTextTheme.titleMedium,),
              const SizedBox(height: AppSpacing.xs,),
              AppTextField(controller: about,hint: AppString.aboutYourSkill,validator: (v) => FormValidators.validateRequiredFields(v),),
              const SizedBox(height: AppSpacing.md,),
              Text(AppString.price,style: context.appTextTheme.titleMedium,),
              const SizedBox(height: AppSpacing.xs,),
              AppTextField(controller: price,hint: AppString.yourPrice,),
              const SizedBox(height: AppSpacing.xl,),
              AppButton(
                  text: 'create skill',
                  isLoading: context.watch<PostSkillProvider>().loading!,
                  onPressed: ()async{

                    if (!_fomKey.currentState!.validate()) {
                      return;
                    }

                    final provider = context.read<PostSkillProvider>();

                    final userId = Supabase.instance.client.auth.currentUser!.id;

                    await provider.createSkill(PostSkillModel(
                        userId: userId,
                        skillName: skillName.text.trim(),
                        category: selectedValue ?? '',
                        location: location.text.trim(),
                        type: type ?? '',
                        level: level ?? '',
                        description: about.text.trim(),
                        createdAt: DateTime.now(),
                        price: int.tryParse(price.text.trim()) ?? 0,
                    ),
                    );

                    AppToast.showToast(message: provider.error ?? 'skill added successfully');

                    context.go(RouteNames.home);
                  }
              ),
              const SizedBox(height: AppSpacing.xl,),

            ],
          ),
        ),
      ),
    );
  }

  Widget CustomDropdown({
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
}){
    final theme = Theme.of(context).colorScheme;

    return DropdownButtonFormField(
        value: value,
        hint: const Text('choose category'),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required field';
          }
          return null;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.onSurfaceVariant.withValues(alpha: 0.1),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none
          )
        ),
        items: items.map((e) {
          return DropdownMenuItem(
              value: e,
              child: Text(e)
          );
        }).toList(),
        onChanged: onChanged
    );
  }
}
