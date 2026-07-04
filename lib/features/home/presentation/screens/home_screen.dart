import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/active_to_buy_summary_card.dart';
import '../../../../shared/widgets/quick_add_recipe_tile.dart';
import '../../../../shared/widgets/responsive_scaffold.dart';
import '../../../ingredients/domain/models/ingredient_catalog.dart';
import '../../../ingredients/presentation/providers/ingredients_provider.dart';
import '../../../inventory/domain/models/inventory_item.dart';
import '../../../inventory/domain/models/storage_space.dart';
import '../../../inventory/domain/repositories/inventory_repository.dart';
import '../../../inventory/presentation/providers/inventory_provider.dart';
import '../../../recipes/presentation/providers/recipes_provider.dart';
import '../../../shopping/presentation/providers/shopping_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _matches(String source) =>
      _searchQuery.isEmpty || source.toLowerCase().contains(_searchQuery);

  String _formatDate(DateTime d) {
    const m = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
    return '${m[d.month - 1]} ${d.day}';
  }

  StorageSpace? _findSpace(List<StorageSpace>? spaces, String? id) {
    if (spaces == null || id == null) return null;
    for (final s in spaces) {
      if (s.id == id) return s;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final spacesAsync = ref.watch(storageSpacesProvider);
    final selectedSpaceId = ref.watch(selectedStorageSpaceIdProvider);
    final inventoryAsync = ref.watch(homeInventoryProvider);
    final ingredientsAsync = ref.watch(ingredientsProvider);
    final recipesAsync = ref.watch(recipesProvider);
    final shoppingState = ref.watch(shoppingListProvider);
    final shoppingNotifier = ref.read(shoppingListProvider.notifier);
    final inventoryRepo = ref.read(inventoryRepositoryProvider);

    final spaces = spacesAsync.valueOrNull ?? <StorageSpace>[];
    final selectedSpace = _findSpace(spaces, selectedSpaceId);
    final selectedSpaceName = selectedSpace?.name ?? 'Kitchen';

    final previewItems = shoppingState.items.take(5).map((item) {
      final qty = (item.quantity ?? 1).round();
      return qty > 1 ? '${item.displayName} x$qty' : item.displayName;
    }).toList();

    return ResponsiveScaffold(
      title: 'Kitchen',
      currentIndex: 0,
      child: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        children: [
          // â”€â”€ Search â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          TextField(
            controller: _searchController,
            onChanged: (v) => setState(() => _searchQuery = v.trim().toLowerCase()),
            decoration: const InputDecoration(
              hintText: 'Search items or recipesâ€¦',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 12),

          // â”€â”€ Storage space filter chips â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: selectedSpaceId == null,
                  onSelected: (_) => ref
                      .read(selectedStorageSpaceIdProvider.notifier)
                      .state = null,
                ),
                ...spaces.map((space) => Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: FilterChip(
                        label: Text(space.name),
                        selected: selectedSpaceId == space.id,
                        onSelected: (_) => ref
                            .read(selectedStorageSpaceIdProvider.notifier)
                            .state = selectedSpaceId == space.id
                            ? null
                            : space.id,
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // â”€â”€ Inventory section â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('In $selectedSpaceName',
                  style: Theme.of(context).textTheme.titleLarge),
              TextButton.icon(
                onPressed: () => context.go('/ingredients/new'),
                icon: const Icon(Icons.add, size: 16),
                label: const Text('Add item'),
              ),
            ],
          ),
          const SizedBox(height: 8),

          inventoryAsync.when(
            data: (items) {
              final filtered = items
                  .where((i) => _matches(i.displayName) || _matches(i.itemKey))
                  .toList();
              if (filtered.isEmpty) {
                return _emptyInventoryState(context, selectedSpaceName);
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: filtered
                    .map((i) => _inventoryTile(context, i, inventoryRepo))
                    .toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Text(e.toString()),
          ),
          const SizedBox(height: 20),

          // â”€â”€ Suggested catalog items â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedSpaceId != null
                    ? 'Suggested for $selectedSpaceName'
                    : 'Catalog',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              TextButton.icon(
                onPressed: () => context.go('/ingredients'),
                icon: const Icon(Icons.arrow_forward, size: 16),
                label: const Text('View all'),
              ),
            ],
          ),
          const SizedBox(height: 8),

          ingredientsAsync.when(
            data: (items) {
              final filtered = items
                  .where((i) {
                    final matchesSearch =
                        _matches(i.displayName) || _matches(i.category ?? '');
                    final matchesSpace = selectedSpaceId == null ||
                        i.defaultStorageSpaceId == selectedSpaceId;
                    return matchesSearch && matchesSpace;
                  })
                  .take(10)
                  .toList();
              if (filtered.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    selectedSpaceId != null
                        ? 'No catalog items mapped to $selectedSpaceName.'
                        : 'No catalog items match your search.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                );
              }
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: filtered
                    .map((i) => _catalogTile(context, i, inventoryRepo,
                        shoppingNotifier, shoppingState, selectedSpaceId))
                    .toList(),
              );
            },
            loading: () => const SizedBox(
                height: 48, child: Center(child: CircularProgressIndicator())),
            error: (e, _) => Text(e.toString()),
          ),

          if (kDebugMode) ...[
            const SizedBox(height: 8),
            ingredientsAsync.when(
              data: (items) {
                if (items.isNotEmpty) return const SizedBox.shrink();
                return OutlinedButton.icon(
                  onPressed: () async {
                    await ref
                        .read(ingredientRepositoryProvider)
                        .insertMissingSystemIngredientsFromJson();
                    ref.invalidate(ingredientCatalogInitializationProvider);
                    ref.invalidate(ingredientsProvider);
                  },
                  icon: const Icon(Icons.download_for_offline_outlined),
                  label: const Text('Import starter ingredients'),
                );
              },
              loading: () => const SizedBox(),
              error: (_, __) => const SizedBox(),
            ),
          ],
          const SizedBox(height: 20),

          // â”€â”€ To-Buy summary â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          ActiveToBuySummaryCard(
            title: shoppingState.activeListName,
            totalItems: shoppingState.items.length,
            uniqueItems: shoppingState.items.length,
            previewItems: previewItems,
          ),
          const SizedBox(height: 20),

          // â”€â”€ Quick Add Recipes â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Quick Add Recipes',
                  style: Theme.of(context).textTheme.titleLarge),
              TextButton.icon(
                onPressed: () => context.go('/recipes'),
                icon: const Icon(Icons.arrow_forward, size: 16),
                label: const Text('View all'),
              ),
            ],
          ),
          const SizedBox(height: 8),

          recipesAsync.when(
            data: (recipes) {
              final filtered = recipes
                  .where((r) => _matches(r.title) || _matches(r.instructions))
                  .take(6)
                  .toList();
              if (filtered.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text('No recipes yet. Add some from the Recipes tab.',
                      style: Theme.of(context).textTheme.bodySmall),
                );
              }
              return Wrap(
                spacing: 16,
                runSpacing: 16,
                children: filtered
                    .map((recipe) => SizedBox(
                          width: 300,
                          child: QuickAddRecipeTile(
                            title: recipe.title,
                            ingredientCount: recipe.ingredients.length,
                            servings: recipe.servings,
                            onAdd: () {
                              final items = recipe.ingredients
                                  .map((ing) => ShoppingItem(
                                        id: ing.ingredientKey,
                                        displayName: ing.displayName,
                                        quantity: ing.quantity,
                                        unit: ing.unit,
                                        source: recipe.title,
                                      ))
                                  .toList();
                              shoppingNotifier.addRecipeIngredients(
                                  recipeTitle: recipe.title, ingredients: items);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Added ${recipe.title} to To-Buy list')));
                            },
                          ),
                        ))
                    .toList(),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => Center(child: Text(e.toString())),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  // â”€â”€ Empty inventory state â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Widget _emptyInventoryState(BuildContext context, String spaceName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        'Your $spaceName is empty. Add items below or from the store.',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
      ),
    );
  }

  // â”€â”€ Inventory item tile â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Widget _inventoryTile(
    BuildContext context,
    InventoryItem item,
    InventoryRepository repo,
  ) {
    final cs = Theme.of(context).colorScheme;
    final isExpiringSoon = item.expiresAt != null &&
        item.expiresAt!
            .isBefore(DateTime.now().add(const Duration(days: 3)));

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.displayName,
                      style: Theme.of(context).textTheme.titleSmall),
                  Row(
                    children: [
                      if (item.storageSpaceName != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: cs.secondaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(item.storageSpaceName!,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: cs.onSecondaryContainer)),
                        ),
                      if (item.unit?.isNotEmpty == true) ...[
                        const SizedBox(width: 6),
                        Text(item.unit!,
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                      if (item.expiresAt != null) ...[
                        const SizedBox(width: 8),
                        Text(
                          'Exp: ${_formatDate(item.expiresAt!)}',
                          style: TextStyle(
                            fontSize: 11,
                            color: isExpiringSoon ? cs.error : cs.outline,
                            fontWeight: isExpiringSoon
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            // Quantity stepper
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 32,
                  height: 32,
                  child: OutlinedButton(
                    onPressed: () =>
                        repo.updateQuantity(item.id, item.quantity - 1),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder()),
                    child: const Icon(Icons.remove, size: 14),
                  ),
                ),
                SizedBox(
                  width: 32,
                  child: Text(
                    item.quantity == item.quantity.roundToDouble()
                        ? item.quantity.toStringAsFixed(0)
                        : item.quantity.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                SizedBox(
                  width: 32,
                  height: 32,
                  child: FilledButton(
                    onPressed: () =>
                        repo.updateQuantity(item.id, item.quantity + 1),
                    style: FilledButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        backgroundColor: cs.primary,
                        foregroundColor: cs.onPrimary),
                    child: const Icon(Icons.add, size: 14),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.check_circle_outline,
                      size: 18, color: cs.primary),
                  onPressed: () => repo.markConsumed(item.id),
                  tooltip: 'Mark consumed',
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // â”€â”€ Catalog suggested item tile â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
  Widget _catalogTile(
    BuildContext context,
    IngredientCatalogItem ing,
    InventoryRepository inventoryRepo,
    ShoppingListNotifier shoppingNotifier,
    ShoppingListState shoppingState,
    String? selectedSpaceId,
  ) {
    final cs = Theme.of(context).colorScheme;
    final qty = shoppingState.quantityFor(ing.ingredientKey);

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      title: Text(ing.displayName),
      subtitle: ing.category != null
          ? Text(ing.category!, style: const TextStyle(fontSize: 11))
          : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Add to Home
          TextButton.icon(
            onPressed: () async {
              final spaceId =
                  selectedSpaceId ?? ing.defaultStorageSpaceId ?? 'other';
              await inventoryRepo.addInventoryItem(
                itemKey: ing.ingredientKey,
                displayName: ing.displayName,
                storageSpaceId: spaceId,
                itemCatalogId: ing.id,
                quantity: 1,
                unit: ing.defaultUnit,
                sourceType: 'manual',
              );
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${ing.displayName} added to inventory')));
            },
            icon: const Icon(Icons.home_outlined, size: 14),
            label: const Text('Home'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              visualDensity: VisualDensity.compact,
              foregroundColor: cs.primary,
            ),
          ),
          // Add to To-Buy (compact stepper)
          if (qty == 0)
            IconButton(
              onPressed: () => shoppingNotifier.addIngredient(
                id: ing.ingredientKey,
                displayName: ing.displayName,
                quantity: 1,
                unit: ing.defaultUnit,
                source: 'Manual add',
              ),
              icon: const Icon(Icons.add_shopping_cart_outlined, size: 18),
              tooltip: 'Add to To-Buy',
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 22,
                  height: 22,
                  child: IconButton(
                    onPressed: () =>
                        shoppingNotifier.decrementIngredient(ing.ingredientKey),
                    icon: const Icon(Icons.remove, size: 11),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
                Text('$qty',
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600)),
                SizedBox(
                  width: 22,
                  height: 22,
                  child: IconButton(
                    onPressed: () =>
                        shoppingNotifier.incrementIngredient(ing.ingredientKey),
                    icon: const Icon(Icons.add, size: 11),
                    padding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
