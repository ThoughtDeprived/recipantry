import 'package:flutter/material.dart';

class IngredientQuickAddCard extends StatelessWidget {
  final String name;
  final String category;
  final String? unit;
  final VoidCallback onAdd;

  const IngredientQuickAddCard({
    super.key,
    required this.name,
    required this.category,
    this.unit,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 16),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(category.toUpperCase(), style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 8),
            Text(name, style: Theme.of(context).textTheme.titleMedium),
            const Spacer(),
            if (unit != null && unit!.isNotEmpty)
              Text('Unit: $unit', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add_shopping_cart_rounded),
              label: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
