import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShoppingItem {
  final String id;
  final String displayName;
  final double? quantity;
  final String? unit;
  final String? source;
  final List<String> sourceRecipes;
  final DateTime addedAt;

  ShoppingItem({
    required this.id,
    required this.displayName,
    this.quantity,
    this.unit,
    this.source,
    List<String>? sourceRecipes,
    DateTime? addedAt,
  })  : sourceRecipes = sourceRecipes ?? const [],
        addedAt = addedAt ?? DateTime.now();

  ShoppingItem copyWith({
    String? id,
    String? displayName,
    double? quantity,
    String? unit,
    String? source,
    List<String>? sourceRecipes,
    DateTime? addedAt,
  }) {
    return ShoppingItem(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      source: source ?? this.source,
      sourceRecipes: sourceRecipes ?? this.sourceRecipes,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}

class ShoppingListState {
  final String activeListName;
  final List<ShoppingItem> items;

  const ShoppingListState({
    required this.activeListName,
    this.items = const [],
  });

  ShoppingListState copyWith({String? activeListName, List<ShoppingItem>? items}) {
    return ShoppingListState(
      activeListName: activeListName ?? this.activeListName,
      items: items ?? this.items,
    );
  }

  int quantityFor(String id) {
    final index = items.indexWhere((item) => item.id == id);
    if (index < 0) return 0;
    return (items[index].quantity ?? 1).round();
  }
}

class ShoppingListNotifier extends StateNotifier<ShoppingListState> {
  ShoppingListNotifier() : super(const ShoppingListState(activeListName: 'Active To-Buy List'));

  void addItem(ShoppingItem item) {
    final existingIndex = state.items.indexWhere((existing) => existing.id == item.id);
    if (existingIndex >= 0) {
      final existing = state.items[existingIndex];
      final mergedRecipes = {
        ...existing.sourceRecipes,
        ...item.sourceRecipes,
        if (item.source != null && item.source!.isNotEmpty && item.source != 'Manual add')
          item.source!,
      }.toList();
      final merged = existing.copyWith(
        quantity: _sumQuantities(existing.quantity, item.quantity),
        sourceRecipes: mergedRecipes,
        source: item.source ?? existing.source,
      );
      final updatedItems = [...state.items];
      updatedItems[existingIndex] = merged;
      state = state.copyWith(items: updatedItems);
      return;
    }
    final sourceRecipes = [
      ...item.sourceRecipes,
      if (item.source != null && item.source!.isNotEmpty && item.source != 'Manual add')
        item.source!,
    ];
    state = state.copyWith(
        items: [...state.items, item.copyWith(sourceRecipes: sourceRecipes)]);
  }

  void addIngredient({
    required String id,
    required String displayName,
    double? quantity,
    String? unit,
    String? source,
    List<String>? sourceRecipes,
  }) {
    addItem(ShoppingItem(
      id: id,
      displayName: displayName,
      quantity: quantity,
      unit: unit,
      source: source,
      sourceRecipes: sourceRecipes,
    ));
  }

  void addRecipeIngredients({
    required String recipeTitle,
    required List<ShoppingItem> ingredients,
  }) {
    for (final ingredient in ingredients) {
      addItem(ingredient.copyWith(
        source: recipeTitle,
        sourceRecipes: [recipeTitle],
      ));
    }
  }

  void incrementIngredient(String id) {
    final existingIndex = state.items.indexWhere((item) => item.id == id);
    if (existingIndex < 0) return;
    final existing = state.items[existingIndex];
    final updatedItems = [...state.items];
    updatedItems[existingIndex] = existing.copyWith(quantity: (existing.quantity ?? 0) + 1);
    state = state.copyWith(items: updatedItems);
  }

  void decrementIngredient(String id) {
    final existingIndex = state.items.indexWhere((item) => item.id == id);
    if (existingIndex < 0) return;
    final existing = state.items[existingIndex];
    final currentQty = (existing.quantity ?? 1).round();
    if (currentQty <= 1) {
      final updatedItems = [...state.items]..removeAt(existingIndex);
      state = state.copyWith(items: updatedItems);
      return;
    }
    final updatedItems = [...state.items];
    updatedItems[existingIndex] = existing.copyWith(quantity: (currentQty - 1).toDouble());
    state = state.copyWith(items: updatedItems);
  }

  void removeItem(String id) {
    state = state.copyWith(
      items: state.items.where((item) => item.id != id).toList(),
    );
  }

  void clear() {
    state = state.copyWith(items: []);
  }

  int get itemCount => state.items.length;

  double? _sumQuantities(double? a, double? b) {
    if (a == null) return b;
    if (b == null) return a;
    return a + b;
  }
}

final shoppingListProvider = StateNotifierProvider<ShoppingListNotifier, ShoppingListState>(
  (ref) => ShoppingListNotifier(),
);