import 'dart:convert';

import 'package:skill_swap/features/post_skill/models/post_skill_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostSkillService {
  final SupabaseClient _client;

  PostSkillService(this._client);

 Future<void> postSkill(PostSkillModel skill)async{
   await _client.from('skills').insert(skill.toJson());
 }

 Future<List<PostSkillModel>> getAllSkills()async{
   final data = await _client
       .from('skills')
       .select()
       .order('created_at', ascending: false);

   return (data as List)
       .map((json) => PostSkillModel.fromJson(json as Map<String, dynamic>))
       .toList();
 }
}