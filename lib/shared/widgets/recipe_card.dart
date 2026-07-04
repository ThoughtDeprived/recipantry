import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final double? servings;
  final List<String> tags;
  final VoidCallback onView;
  final VoidCallback onAdd;

  const RecipeCard({
    super.key,
    required this.title,
    this.servings,
    this.tags = const [],
    required this.onView,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            if (servings != null) Text('${servings!.toStringAsFixed(0)} servings'),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags.map((tag) => Chip(label: Text(tag))).toList(),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: onView, child: const Text('View')),
                ElevatedButton(onPressed: onAdd, child: const Text('Add to To-Buy')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
