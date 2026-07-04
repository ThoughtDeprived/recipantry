import 'package:flutter/material.dart';

class QuickAddRecipeTile extends StatelessWidget {
  final String title;
  final int ingredientCount;
  final double? servings;
  final VoidCallback onAdd;

  const QuickAddRecipeTile({
    super.key,
    required this.title,
    required this.ingredientCount,
    this.servings,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('$ingredientCount ingredients', style: Theme.of(context).textTheme.bodySmall),
            if (servings != null) ...[
              const SizedBox(height: 4),
              Text('Serves ${servings!.toStringAsFixed(0)}', style: Theme.of(context).textTheme.bodySmall),
            ],
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                onPressed: onAdd,
                child: const Text('Add recipe'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
