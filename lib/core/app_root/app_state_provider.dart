import 'package:flutter/material.dart';
import 'package:skill_swap/core/app_root/app_status.dart';
import 'package:skill_swap/core/services/app_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppStateProvider extends ChangeNotifier{
  final AppStorageService storage;

  AppStateProvider(this.storage);

  AppStatus _status = AppStatus.loading;
  AppStatus get status => _status;

  Future<void> initApp()async{
    _status = AppStatus.loading;
    notifyListeners();

    final onboardingDone = await storage.isOnboardingCompleted();

    if(!onboardingDone){
      _status = AppStatus.onboarding;
      notifyListeners();
      return;
    }

    final user = Supabase.instance.client.auth.currentUser;

    if(user != null){
      _status = AppStatus.authenticated;
    }else{
      _status = AppStatus.unauthenticated;
    }

    notifyListeners();
  }

  void setAuthenticated(){
    _status = AppStatus.authenticated;
    notifyListeners();
  }

  void setLoggedOut(){
    _status = AppStatus.unauthenticated;
    notifyListeners();
  }

  void completeOnboarding(){
    _status = AppStatus.unauthenticated;
    notifyListeners();
  }
}