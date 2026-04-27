import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends ChangeNotifier{
  final _service = SupabaseService.instance;

  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void initUser(){
    _user = _service.currentUser;
    notifyListeners();
  }

  Future<bool> signUp(String fullName, String email, String password)async{
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final user = await _service.signUp(
          fullName: fullName, email: email, password: password);

      if (user == null) {
        _errorMessage = 'Sign up failed. Please try again';
        return false;
      }

      _user = user;
      return true;
    }on AuthApiException catch(e){
      _errorMessage = e.message;
      return false;
    }catch(e){
      _errorMessage = 'Something went wrong. Please try again.';
      return false;
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> signIn(String email, String password)async{
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      final user = await _service.signIn(email: email, password: password);

      if (user == null) {
        _errorMessage = 'Login failed. Please try again';
        return false;
      }

      _user = user;
      return true;
    }on AuthApiException catch(e){
      _errorMessage = e.message;
      return false;

    }catch(e){
      _errorMessage = 'Something went wrong. Please try again';
      return false;
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut()async{
    await _service.signOut();
    _user = null;
    notifyListeners();
  }
}