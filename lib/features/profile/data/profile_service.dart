import 'package:skill_swap/features/profile/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileService {
  final SupabaseClient _client;
  ProfileService(this._client);

  Future<ProfileModel> getProfile(String userId)async{
    final data = await _client
        .from('profiles')
        .select()
        .eq('id', userId)
        .single();

    return ProfileModel.fromJson(data);
  }
}