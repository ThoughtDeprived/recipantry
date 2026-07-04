import 'package:flutter/material.dart';
import '../shared/theme/app_theme.dart';
import 'router.dart';

class RecipantryApp extends StatelessWidget {
  const RecipantryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recipantry',
      theme: AppTheme.lightTheme,
      routerConfig: appRouter,
    );
  }
}