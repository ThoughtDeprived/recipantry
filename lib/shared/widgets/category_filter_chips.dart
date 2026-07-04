import 'package:flutter/material.dart';

class CategoryFilterChips extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  const CategoryFilterChips({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: categories.map((category) {
        final selected = selectedCategory == category;
        return ChoiceChip(
          label: Text(category),
          selected: selected,
          onSelected: (_) => onSelected(category),
        );
      }).toList(),
    );
  }
}
