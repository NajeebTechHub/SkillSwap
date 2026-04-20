import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/constants/app_sizes.dart';
import 'package:skill_swap/features/alert/presentation/pages/alert_page.dart';
import 'package:skill_swap/features/chat/presentation/pages/chat_list_page.dart';
import 'package:skill_swap/features/home/presentation/pages/home_page.dart';
import 'package:skill_swap/features/profile/presentation/pages/profile_page.dart';

class BottomNavBar extends StatefulWidget {

  const BottomNavBar({super.key, required this.child});
  final Widget child;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final screens = [
    const HomePage(),
    const ChatListPage(),
    const AlertPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(CupertinoIcons.chat_bubble,size: AppSizes.iconMd,), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.notifications_outlined), label: 'Alert'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}