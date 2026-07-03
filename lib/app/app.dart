import 'package:flutter/material.dart';
import 'router.dart';

class RecipantryApp extends StatelessWidget {
  const RecipantryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Recipantry',
      routerConfig: appRouter,
    );
  }
}