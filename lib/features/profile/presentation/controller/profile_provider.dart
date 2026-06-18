import 'package:flutter/cupertino.dart';
import 'package:skill_swap/features/profile/data/profile_service.dart';
import 'package:skill_swap/features/profile/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileService _service;

  ProfileProvider(this._service);

  ProfileModel? _profile;
  bool _isLoading = false;
  String? _error;

  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;
  String? get error => _error;


  Future<void> loadProfile()async{
    try{
      _isLoading = true;
      _error = null;
      notifyListeners();

      final userId = Supabase.instance.client.auth.currentUser!.id;

      _profile = await _service.getProfile(userId);

    }catch(e){
     _error = e.toString();
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}