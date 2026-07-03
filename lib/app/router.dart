import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/recipes/presentation/screens/recipes_list_screen.dart';
import '../features/grocery_trips/presentation/screens/trips_list_screen.dart';
import '../features/pantry/presentation/screens/pantry_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const RecipesListScreen(),
    ),
    GoRoute(
      path: '/trips',
      builder: (context, state) => const TripsListScreen(),
    ),
    GoRoute(
      path: '/pantry',
      builder: (context, state) => const PantryScreen(),
    ),
  ],
);