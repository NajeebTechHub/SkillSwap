import 'package:flutter/cupertino.dart';
import 'package:skill_swap/features/post_skill/data/post_skill_service.dart';
import 'package:skill_swap/features/post_skill/models/post_skill_model.dart';

class PostSkillProvider extends ChangeNotifier{
  final PostSkillService _service;

  PostSkillProvider(this._service);

  PostSkillModel? _skill;
  bool? _loading = false;
  String? _error;

  PostSkillModel? get skill => _skill;
  bool? get loading => _loading;
  String? get error => _error;

  Future<void> createSkill(PostSkillModel skill) async{
    try{

      _loading = true;
      _error = null;
      notifyListeners();

      await _service.postSkill(skill);

    }catch(e){
      _error = e.toString();
    }finally{
      _loading = false;
      notifyListeners();
    }
  }
}