import 'package:flutter/material.dart';

class QuickAddIngredientTile extends StatelessWidget {
  final String name;
  final String category;
  final String? unit;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuickAddIngredientTile({
    super.key,
    required this.name,
    required this.category,
    this.unit,
    required this.quantity,
    required this.onAdd,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(category.toUpperCase(), style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 8),
            Text(name, style: Theme.of(context).textTheme.titleMedium),
            if (unit != null && unit!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(unit!, style: Theme.of(context).textTheme.bodySmall),
            ],
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: quantity == 0
                  ? FilledButton.icon(
                      onPressed: onAdd,
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Add'),
                      style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        visualDensity: VisualDensity.compact,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 36,
                          height: 36,
                          child: OutlinedButton(
                            onPressed: onDecrement,
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(Icons.remove, size: 16),
                          ),
                        ),
                        SizedBox(
                          width: 36,
                          child: Text(
                            '$quantity',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        SizedBox(
                          width: 36,
                          height: 36,
                          child: FilledButton(
                            onPressed: onIncrement,
                            style: FilledButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const CircleBorder(),
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.onPrimary,
                            ),
                            child: const Icon(Icons.add, size: 16),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

