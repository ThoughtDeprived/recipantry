import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/responsive_scaffold.dart';
import '../providers/recipes_provider.dart';

class RecipesListScreen extends ConsumerWidget {
  const RecipesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsync = ref.watch(recipesProvider);

    Future<void> seedRecipes() async {
      await ref.read(recipeRepositoryProvider).seedSampleRecipes();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sample recipes loaded')),
        );
      }
    }

    return ResponsiveScaffold(
      title: 'Recipes',
      currentIndex: 2,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/recipes/new'),
        icon: const Icon(Icons.add),
        label: const Text('Add Recipe'),
      ),
      child: recipesAsync.when(
        data: (recipes) {
          if (recipes.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No recipes yet'),
                  const SizedBox(height: 12),
                  if (kDebugMode)
                    ElevatedButton.icon(
                      onPressed: seedRecipes,
                      icon: const Icon(Icons.auto_fix_high),
                      label: const Text('Seed sample recipes'),
                    ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return ListTile(
                title: Text(recipe.title),
                subtitle: Text(recipe.instructions),
                trailing: recipe.servings != null
                    ? Text('${recipe.servings?.toStringAsFixed(0)} servings')
                    : null,
                onTap: () => context.go('/recipes/${recipe.id}'),
              );
            },
          );
        },
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 12),
              Text('Loading recipes...'),
            ],
          ),
        ),
        error: (e, _) => Center(child: Text(e.toString())),
      ),
    );
  }
}