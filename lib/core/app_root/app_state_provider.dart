import 'dart:async';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/app_root/app_status.dart';
import 'package:skill_swap/core/services/app_storage_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppStateProvider extends ChangeNotifier{
  final AppStorageService storage;
  StreamSubscription<AuthState>? _authSubscription;

  AppStateProvider(this.storage);

  AppStatus _status = AppStatus.loading;
  AppStatus get status => _status;

  Future<void> initApp() async {
    _status = AppStatus.loading;
    notifyListeners();

    final onboardingDone = await storage.isOnboardingCompleted();

    if (!onboardingDone) {
      _status = AppStatus.onboarding;
      notifyListeners();
      return;
    }

    final user = Supabase.instance.client.auth.currentUser;
    _updateAuthStatus(user);

    _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      _updateAuthStatus(data.session?.user);
    });
  }

  void _updateAuthStatus(User? user) {
    if (user != null) {
      _status = AppStatus.authenticated;
    } else {
      _status = AppStatus.unauthenticated;
    }
    notifyListeners();
  }

  Future<void> completeOnboarding() async {
    await storage.setOnboardingCompleted();
    final user = Supabase.instance.client.auth.currentUser;
    _updateAuthStatus(user);
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}