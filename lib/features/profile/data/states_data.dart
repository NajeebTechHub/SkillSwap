import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/features/profile/models/states_model.dart';

class StatesData {
  static final states = [
    StatesModel(count: 22, label: AppString.sessions),
    StatesModel(count: 18, label: AppString.hours),
    StatesModel(count: 5, label: AppString.mentors),
  ];
}