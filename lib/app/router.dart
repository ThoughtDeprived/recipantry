import 'package:go_router/go_router.dart';
import '../features/home/presentation/screens/home_screen.dart';
import '../features/ingredients/presentation/screens/ingredient_form_screen.dart';
import '../features/ingredients/presentation/screens/ingredients_list_screen.dart';
import '../features/recipes/presentation/screens/recipe_detail_screen.dart';
import '../features/recipes/presentation/screens/recipe_form_screen.dart';
import '../features/recipes/presentation/screens/recipes_list_screen.dart';
import '../features/shopping/presentation/screens/shopping_screen.dart';
import '../features/planner/presentation/screens/planner_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/inventory/presentation/screens/storage_spaces_screen.dart';
import '../features/grocery_trips/presentation/screens/trips_list_screen.dart';
import '../features/pantry/presentation/screens/pantry_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/recipes',
      builder: (context, state) => const RecipesListScreen(),
    ),
    GoRoute(
      path: '/recipes/new',
      builder: (context, state) => const RecipeFormScreen(),
    ),
    GoRoute(
      path: '/recipes/:recipeId',
      builder: (context, state) => RecipeDetailScreen(
        recipeId: state.pathParameters['recipeId']!,
      ),
    ),
    GoRoute(
      path: '/recipes/:recipeId/edit',
      builder: (context, state) => RecipeFormScreen(
        recipeId: state.pathParameters['recipeId'],
      ),
    ),
    GoRoute(
      path: '/ingredients',
      builder: (context, state) => const IngredientsListScreen(),
    ),
    GoRoute(
      path: '/ingredients/new',
      builder: (context, state) => const IngredientFormScreen(),
    ),
    GoRoute(
      path: '/ingredients/:ingredientId/edit',
      builder: (context, state) => IngredientFormScreen(
        ingredientId: state.pathParameters['ingredientId'],
      ),
    ),
    GoRoute(
      path: '/shopping',
      builder: (context, state) => const ShoppingScreen(),
    ),
    GoRoute(
      path: '/planner',
      builder: (context, state) => const PlannerScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/storage-spaces',
      builder: (context, state) => const StorageSpacesScreen(),
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