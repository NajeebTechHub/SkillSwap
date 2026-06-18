import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  SupabaseService._();

  static final SupabaseService instance = SupabaseService._();

  late final SupabaseClient _client;

  SupabaseClient get client => _client;
  User? get currentUser => _client.auth.currentUser;

  Future<void> init({
    required String url,
    required String anonKey
})async{
    await Supabase.initialize(url: url, anonKey: anonKey);
    _client = Supabase.instance.client;
  }

  Future<User?> signUp({
    required String fullName,
    required String email,
    required String password,
})async{
    final response = await _client.auth.signUp(
        data: {'fullName' : fullName},
        email: email,
        password: password
    );

    final user = response.user;

    if(user != null){
      await _client.from('profiles').insert({
        'id' : user.id,
        'name' : fullName,
        'email' : email
      });
    }

    return response.user;
  }

  Future<User?> signIn({
    required String email,
    required String password,
})async{
    final response = await _client.auth.signInWithPassword(
        email: email,
        password: password);

    return response.user;
  }

  Future<void> signOut()async{
    await _client.auth.signOut();
  }
}