import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class AuthController extends ChangeNotifier{

  final _service = SupabaseService.instance;

  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  void initUser(){
    _user = _service.currentUser;
    notifyListeners();
  }

  Future<void> signUp(String name, String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      final user = await _service.signUp(
        name: name,
        email: email,
        password: password,
      );

      if (user == null) {
        throw Exception("Check your email for verification");
      }

      _user = user;
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}