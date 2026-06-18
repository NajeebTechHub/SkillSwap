import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/widgets/app_button.dart';
import 'package:skill_swap/core/widgets/app_text_field.dart';
import 'package:skill_swap/features/post_skill/models/post_skill_model.dart';
import 'package:skill_swap/features/post_skill/presentation/controller/post_skill_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
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
            AppTextField(controller: skillName,hint: AppString.enterSkillName,),
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
            AppTextField(controller: location, hint: AppString.yourLocation,),
            const SizedBox(height: AppSpacing.md,),
            Text(AppString.experience,style: context.appTextTheme.titleMedium,),
            const SizedBox(height: AppSpacing.xs,),
            AppTextField(controller: experience,hint: AppString.yourExperience,),
            const SizedBox(height: AppSpacing.md,),
            Text(AppString.about,style: context.appTextTheme.titleMedium,),
            const SizedBox(height: AppSpacing.xs,),
            AppTextField(controller: about,hint: AppString.aboutYourSkill,),
            const SizedBox(height: AppSpacing.md,),
            Text(AppString.price,style: context.appTextTheme.titleMedium,),
            const SizedBox(height: AppSpacing.xs,),
            AppTextField(controller: price,hint: AppString.yourPrice,),
            const SizedBox(height: AppSpacing.xl,),
            AppButton(
                text: 'create skill',
                isLoading: context.watch<PostSkillProvider>().loading!,
                onPressed: ()async{
                  final provider = context.read<PostSkillProvider>();

                  final userId = Supabase.instance.client.auth.currentUser!.id;

                  await provider.createSkill(PostSkillModel(
                      userId: userId,
                      skillName: skillName.text.trim(),
                      category: selectedValue!,
                      location: location.text.trim(),
                      type: type!,
                      level: level!,
                      description: about.text.trim(),
                      createdAt: DateTime.now(),
                      price: int.parse(price.text.trim())
                  ),
                  );
                }
            ),
            const SizedBox(height: AppSpacing.xl,),

          ],
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
