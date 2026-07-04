import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/responsive_scaffold.dart';
import '../../../shopping/presentation/providers/shopping_provider.dart';
import '../providers/ingredients_provider.dart';

class IngredientsListScreen extends ConsumerStatefulWidget {
  const IngredientsListScreen({super.key});

  @override
  ConsumerState<IngredientsListScreen> createState() => _IngredientsListScreenState();
}

class _IngredientsListScreenState extends ConsumerState<IngredientsListScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ingredientsAsync = ref.watch(ingredientsProvider);

    return ResponsiveScaffold(
      title: 'Ingredients',
      currentIndex: 0,
      child: ingredientsAsync.when(
        data: (ingredients) {
          final query = _searchController.text.trim().toLowerCase();
          final filteredIngredients = ingredients.where((ingredient) {
            if (query.isEmpty) return true;
            return ingredient.displayName.toLowerCase().contains(query) ||
                (ingredient.category?.toLowerCase().contains(query) ?? false) ||
                (ingredient.aliases?.toLowerCase().contains(query) ?? false);
          }).toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: const InputDecoration(
                    labelText: 'Search ingredients',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredIngredients.length,
                  itemBuilder: (context, index) {
                    final ingredient = filteredIngredients[index];
                    return ListTile(
                      title: Text(ingredient.displayName),
                      subtitle: Text(
                        [
                          if (ingredient.category != null && ingredient.category!.isNotEmpty) ingredient.category,
                          if (ingredient.defaultUnit != null && ingredient.defaultUnit!.isNotEmpty) 'Default unit: ${ingredient.defaultUnit}',
                        ].whereType<String>().join(' • '),
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.go('/ingredients/${ingredient.id}/edit'),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
      ),
    );
  }
}
