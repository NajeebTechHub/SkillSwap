import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:skill_swap/core/app_root/app_state_provider.dart';
import 'package:skill_swap/core/app_root/app_status.dart';
import 'package:skill_swap/features/auth/presentation/pages/login/login_page.dart';
import 'package:skill_swap/features/bottom_navigation/pages/bottom_navbar.dart';
import 'package:skill_swap/features/home/presentation/pages/home_page.dart';
import 'package:skill_swap/features/onboarding/presentation/pages/onboarding_pages.dart';
import 'package:skill_swap/features/splash/presentation/splash_page.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask((){
      context.read<AppStateProvider>().initApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(builder: (context, app, _){
      switch(app.status){
        case AppStatus.loading:
          return const SplashPage();
        case AppStatus.onboarding:
          return const OnboardingPages();
        case AppStatus.unauthenticated:
          return const LoginPage();
        case AppStatus.authenticated:
          return const BottomNavBar(child: HomePage());
      }
    });
  }
}
