import 'package:flutter/material.dart';
import 'package:skill_swap/core/constants/app_string.dart';
import 'package:skill_swap/core/extensions/context_theme.dart';
import 'package:skill_swap/features/profile/presentation/widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileHeader()
        ],
      )
    );
  }
}
