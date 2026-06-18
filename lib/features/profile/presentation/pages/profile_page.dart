import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/constants/app_radius.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/core/constants/app_spacing.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/core/router/route_names.dart';
import 'package:skill_swap/features/auth/presentation/controller/auth_controller.dart';
import 'package:skill_swap/features/profile/data/menu_data.dart';
import 'package:skill_swap/features/profile/data/states_data.dart';
import 'package:skill_swap/features/profile/presentation/controller/profile_provider.dart';
import 'package:skill_swap/features/profile/presentation/widgets/profile_header.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.microtask((){
      context.read<ProfileProvider>().loadProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final states = StatesData.states;
    final   menus = MenuData.menus;
    return Consumer<ProfileProvider>(
        builder: (context, provider, _){

          if(provider.isLoading){
            return const CircularProgressIndicator();
          }

          if(provider.error != null){
            return Text(provider.error!);
          }

          final profile = provider.profile;

          if(profile == null){
            return const Text('No profile found');
          }

          return Scaffold(
            body: Column(
              children: [
                ProfileHeader(states: states, profile: profile,),

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
                        child: InkWell(
                          borderRadius: AppRadius.mdRadius,
                          onTap: (){
                            if(index == 6){
                              showLogoutDialog(context);
                            }
                          },
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
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
    );




  }

  void showLogoutDialog(BuildContext context){
     showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to log out of your account?'),
            actions: <Widget>[
              TextButton(onPressed: (){
                context.pop();
              }, child: const Text('Cancel')),
              TextButton(onPressed: ()async{
                context.pop();
                await context.read<AuthController>().signOut();
              }, child: const Text('Logout'))
            ],
          );
        }
    );
  }
}
