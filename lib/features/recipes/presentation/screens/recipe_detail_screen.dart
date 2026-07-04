import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/recipes_provider.dart';
import '../../domain/models/recipe.dart' as domain;
import '../../domain/models/recipe_step.dart' as domain_step;

class RecipeDetailScreen extends ConsumerWidget {
  final String recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeAsync = ref.watch(recipeProvider(recipeId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe details'),
        actions: [
          IconButton(
            onPressed: () => context.go('/recipes/$recipeId/edit'),
            icon: const Icon(Icons.edit_outlined),
          ),
        ],
      ),
      body: recipeAsync.when(
        data: (recipe) {
          if (recipe == null) {
            return const Center(child: Text('Recipe not found'));
          }

          return _RecipeDetailView(recipe: recipe);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }
}

class _RecipeDetailView extends StatelessWidget {
  final domain.Recipe recipe;

  const _RecipeDetailView({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(recipe.title, style: Theme.of(context).textTheme.headlineSmall),
        if (recipe.servings != null) ...[
          const SizedBox(height: 8),
          Text('Servings: ${recipe.servings!.toStringAsFixed(0)}'),
        ],
        const SizedBox(height: 8),
        Text(recipe.instructions, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 20),
        const Text('Ingredients', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...recipe.ingredients.map((ingredient) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ingredient.displayName,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  if (ingredient.quantity != null || ingredient.unit != null) ...[
                    Text('${ingredient.quantity?.toStringAsFixed(0) ?? ''} ${ingredient.unit ?? ''}'.trim()),
                  ],
                  if (ingredient.note != null && ingredient.note!.isNotEmpty) Text(ingredient.note!),
                  ...ingredient.substitutes.map(
                    (sub) => Padding(
                      padding: const EdgeInsets.only(left: 12, top: 4),
                      child: Text(
                        'Substitute: ${sub.substituteDisplayName}${sub.quantity != null ? ' ${sub.quantity!.toStringAsFixed(0)}' : ''}${sub.unit != null ? ' ${sub.unit}' : ''}${sub.note != null ? ' • ${sub.note}' : ''}'.trim(),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        const SizedBox(height: 20),
        const Text('Steps', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ..._groupedSteps(recipe).entries.map((entry) {
          final section = entry.key;
          final steps = entry.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (section != null && section.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: Text(section, style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
              ...steps.asMap().entries.map((item) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text('${item.key + 1}. ${item.value.instruction}'),
                  )),
            ],
          );
        }),
      ],
    );
  }

  Map<String?, List<domain_step.RecipeStep>> _groupedSteps(domain.Recipe recipe) {
    final grouped = <String?, List<domain_step.RecipeStep>>{};
    for (final step in recipe.steps) {
      grouped.putIfAbsent(step.sectionName, () => <domain_step.RecipeStep>[]);
      grouped[step.sectionName]!.add(step);
    }
    return grouped;
  }
}
