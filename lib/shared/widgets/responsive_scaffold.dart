import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final int currentIndex;
  final Widget? floatingActionButton;

  const ResponsiveScaffold({
    super.key,
    required this.child,
    required this.title,
    required this.currentIndex,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(padding: const EdgeInsets.all(16), child: child),
      bottomNavigationBar: _BottomNavigationBar(currentIndex: currentIndex),
      floatingActionButton: floatingActionButton,
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  final int currentIndex;

  const _BottomNavigationBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.go('/');
            break;
          case 1:
            context.go('/shopping');
            break;
          case 2:
            context.go('/recipes');
            break;
          case 3:
            context.go('/planner');
            break;
          case 4:
            context.go('/profile');
            break;
        }
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.kitchen_rounded), label: 'Kitchen'),
        NavigationDestination(icon: Icon(Icons.shopping_bag_rounded), label: 'Shopping'),
        NavigationDestination(icon: Icon(Icons.restaurant_menu_rounded), label: 'Recipes'),
        NavigationDestination(icon: Icon(Icons.calendar_month_rounded), label: 'Planner'),
        NavigationDestination(icon: Icon(Icons.person_rounded), label: 'Profile'),
      ],
    );
  }
}
