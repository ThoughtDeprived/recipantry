import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../shared/widgets/responsive_scaffold.dart';
import '../providers/shopping_provider.dart';

class ShoppingScreen extends ConsumerWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingState = ref.watch(shoppingListProvider);
    final notifier = ref.read(shoppingListProvider.notifier);
    final cs = Theme.of(context).colorScheme;

    if (shoppingState.items.isEmpty) {
      return const ResponsiveScaffold(
        title: 'Shopping',
        currentIndex: 1,
        child: Center(
            child: Text(
                'Your To-Buy list is empty.\nAdd ingredients or recipes from the Kitchen.')),
      );
    }

    return ResponsiveScaffold(
      title: 'Shopping',
      currentIndex: 1,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          notifier.clear();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('To-Buy list cleared.')));
        },
        icon: const Icon(Icons.delete_outline),
        label: const Text('Clear all'),
        backgroundColor: cs.errorContainer,
        foregroundColor: cs.onErrorContainer,
      ),
      child: ListView.separated(
        itemCount: shoppingState.items.length,
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemBuilder: (context, index) {
          final item = shoppingState.items[index];
          final qty = shoppingState.quantityFor(item.id);

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(item.displayName,
                          style: Theme.of(context).textTheme.titleSmall),
                      if (item.unit?.isNotEmpty == true)
                        Text(
                          '${qty > 0 ? '$qty ' : ''}${item.unit}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      if (item.sourceRecipes.isNotEmpty) ...[  
                        const SizedBox(height: 4),
                        Text(
                          'Needed for: ${item.sourceRecipes.join(', ')}',
                          style: TextStyle(
                              fontSize: 11,
                              color: cs.secondary,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: OutlinedButton(
                        onPressed: () => notifier.decrementIngredient(item.id),
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const CircleBorder()),
                        child: const Icon(Icons.remove, size: 16),
                      ),
                    ),
                    SizedBox(
                      width: 36,
                      child: Text(
                        '$qty',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: FilledButton(
                        onPressed: () => notifier.incrementIngredient(item.id),
                        style: FilledButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const CircleBorder(),
                            backgroundColor: cs.primary,
                            foregroundColor: cs.onPrimary),
                        child: const Icon(Icons.add, size: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
