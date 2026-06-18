import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/app_root/app_state_provider.dart';
import 'package:skill_swap/core/router/app_router.dart' as AppRouter;
import 'package:skill_swap/core/services/app_storage_service.dart';
import 'package:skill_swap/core/services/supabase_service.dart';
import 'package:skill_swap/core/theme/app_theme.dart';
import 'package:skill_swap/features/auth/presentation/controller/auth_controller.dart';
import 'package:skill_swap/features/post_skill/data/post_skill_service.dart';
import 'package:skill_swap/features/post_skill/presentation/controller/post_skill_controller.dart';
import 'package:skill_swap/features/profile/data/profile_service.dart';
import 'package:skill_swap/features/profile/presentation/controller/profile_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  await SupabaseService.instance.init(
      url: 'https://xbfpgdeyidrrqypgcuny.supabase.co',
      anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhiZnBnZGV5aWRycnF5cGdjdW55Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzY3NDc0NjQsImV4cCI6MjA5MjMyMzQ2NH0.AiSK_UQSltFUMk5tHMslsv2qGsjISCIOixj8pBwXt50');

  runApp(
    // DevicePreview(
    //     builder: (context) => const MyApp()
    // )
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStorageService>(create: (context) => AppStorageService()),
        ChangeNotifierProvider(create: (context) => AuthController()),
        ChangeNotifierProvider<AppStateProvider>(create: (context) => AppStateProvider(context.read<AppStorageService>())),
        ChangeNotifierProvider(create: (context) => ProfileProvider(ProfileService(Supabase.instance.client))),
        ChangeNotifierProvider(create: (context) => PostSkillProvider(PostSkillService(Supabase.instance.client)))
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
