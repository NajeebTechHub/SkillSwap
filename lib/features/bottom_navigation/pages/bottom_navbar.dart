import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_swap/core/router/route_names.dart';

class BottomNavBar extends StatelessWidget {

  const BottomNavBar({super.key, required this.child});
  final Widget child;

  int _getIndex(String location) {
    if (location.startsWith(RouteNames.home)) return 0;
    if (location.startsWith(RouteNames.chat)) return 1;
    if (location.startsWith(RouteNames.alert)) return 2;
    if (location.startsWith(RouteNames.profile)) return 3;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    const routes = [
      RouteNames.home,
      RouteNames.chat,
      RouteNames.alert,
      RouteNames.profile,
    ];
    context.go(routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _getIndex(location),
        onDestinationSelected: (index) => _onTap(context, index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat_outlined),
            selectedIcon: Icon(Icons.chat),
            label: 'Chat',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications),
            label: 'Alert',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}