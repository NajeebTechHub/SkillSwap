import 'package:flutter/material.dart';
import 'package:skill_swap/core/router/app_router.dart' as AppRouter;
import 'package:skill_swap/core/theme/app_theme.dart';

void main(){
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
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
    );
  }
}
