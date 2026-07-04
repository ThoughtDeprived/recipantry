import 'package:flutter/material.dart';

class ActiveToBuySummaryCard extends StatelessWidget {
  final String title;
  final int totalItems;
  final int uniqueItems;
  final List<String> previewItems;

  const ActiveToBuySummaryCard({
    super.key,
    required this.title,
    required this.totalItems,
    required this.uniqueItems,
    required this.previewItems,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text('$totalItems items • $uniqueItems unique', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 14),
            if (previewItems.isNotEmpty)
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: previewItems.map((item) => Chip(label: Text(item))).toList(),
              ),
            if (previewItems.isEmpty)
              Text('No items yet. Add ingredients or recipes from the Kitchen.', style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
