import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../../ingredients/domain/models/ingredient_catalog.dart';
import '../../../ingredients/presentation/providers/ingredients_provider.dart';
import '../providers/recipes_provider.dart';
import '../../domain/models/recipe.dart' as domain;
import '../../domain/models/recipe_ingredient.dart' as domain_ingredient;
import '../../domain/models/recipe_step.dart' as domain_step;

class RecipeFormScreen extends ConsumerStatefulWidget {
  final String? recipeId;

  const RecipeFormScreen({super.key, this.recipeId});

  @override
  ConsumerState<RecipeFormScreen> createState() => _RecipeFormScreenState();
}

class _RecipeFormScreenState extends ConsumerState<RecipeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _servingsController = TextEditingController();
  final _instructionsController = TextEditingController();
  final List<_IngredientRow> _ingredients = [];
  final List<_StepRow> _steps = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadRecipe();
    });
  }

  Future<void> _loadRecipe() async {
    if (widget.recipeId == null) {
      setState(() => _loading = false);
      return;
    }

    final recipe = await ref.read(recipeRepositoryProvider).getRecipe(widget.recipeId!);
    if (!mounted) return;

    if (recipe != null) {
      _titleController.text = recipe.title;
      _servingsController.text = recipe.servings?.toString() ?? '';
      _instructionsController.text = recipe.instructions;
      _ingredients.clear();
      _ingredients.addAll(
        recipe.ingredients.map(
          (ingredient) => _IngredientRow(
            ingredient: ingredient,
            substitutes: ingredient.substitutes
                .map((s) => _SubstituteRow(substitute: s))
                .toList(),
          ),
        ),
      );
      for (final row in _ingredients) {
        row.nameController.text = row.ingredient?.displayName ?? '';
        row.quantityController.text = row.ingredient?.quantity?.toString() ?? '';
        row.unitController.text = row.ingredient?.unit ?? '';
        row.noteController.text = row.ingredient?.note ?? '';
        row.ingredientId = row.ingredient?.ingredientId;
        for (final sub in row.substitutes) {
          sub.nameController.text = sub.substitute?.substituteDisplayName ?? '';
          sub.quantityController.text = sub.substitute?.quantity?.toString() ?? '';
          sub.unitController.text = sub.substitute?.unit ?? '';
          sub.noteController.text = sub.substitute?.note ?? '';
        }
      }
      _steps.clear();
      _steps.addAll(recipe.steps.map((step) => _StepRow(step: step)));
      for (final row in _steps) {
        row.sectionController.text = row.step?.sectionName ?? '';
        row.instructionController.text = row.step?.instruction ?? '';
        row.timerController.text = row.step?.timerMinutes?.toString() ?? '';
      }
    }

    setState(() => _loading = false);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _servingsController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  String _normalizeKey(String value) {
    final trimmed = value.trim().toLowerCase();
    return trimmed.replaceAll(RegExp(r'\s+'), '_');
  }

  Future<void> _saveRecipe() async {
    if (!_formKey.currentState!.validate()) return;

    if (_ingredients.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Consider adding at least one ingredient.')),
      );
    }
    if (_steps.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Consider adding at least one step.')),
      );
    }

    final id = widget.recipeId ?? const Uuid().v4();
    final recipe = domain.Recipe(
      id: id,
      title: _titleController.text.trim(),
      servings: double.tryParse(_servingsController.text.trim()),
      instructions: _instructionsController.text.trim(),
      ingredients: _ingredients
          .where((row) => row.nameController.text.trim().isNotEmpty)
          .map(
            (row) {
              final ingredientId = row.ingredient?.id ?? const Uuid().v4();
              return domain_ingredient.RecipeIngredient(
                id: ingredientId,
                recipeId: id,
                ingredientId: row.ingredientId,
                ingredientKey: row.selectedCatalogIngredient?.ingredientKey ?? _normalizeKey(row.nameController.text),
                displayName: row.nameController.text.trim(),
                quantity: double.tryParse(row.quantityController.text.trim()),
                unit: row.unitController.text.trim().isEmpty
                    ? null
                    : row.unitController.text.trim(),
                note: row.noteController.text.trim().isEmpty
                    ? null
                    : row.noteController.text.trim(),
                sortOrder: _ingredients.indexOf(row),
                substitutes: row.substitutes
                    .where((sub) => sub.nameController.text.trim().isNotEmpty)
                    .map(
                      (sub) => domain_ingredient.RecipeIngredientSubstitute(
                        id: sub.substitute?.id ?? const Uuid().v4(),
                        recipeIngredientId: ingredientId,
                        substituteIngredientKey: _normalizeKey(
                          sub.nameController.text,
                        ),
                        substituteDisplayName: sub.nameController.text.trim(),
                        quantity: double.tryParse(sub.quantityController.text.trim()),
                        unit: sub.unitController.text.trim().isEmpty
                            ? null
                            : sub.unitController.text.trim(),
                        note: sub.noteController.text.trim().isEmpty
                            ? null
                            : sub.noteController.text.trim(),
                        sortOrder: row.substitutes.indexOf(sub),
                      ),
                    )
                    .toList(),
              );
            },
          )
          .toList(),
      steps: _steps
          .where((row) => row.instructionController.text.trim().isNotEmpty)
          .map(
            (row) => domain_step.RecipeStep(
              id: row.step?.id ?? const Uuid().v4(),
              recipeId: id,
              sectionName: row.sectionController.text.trim().isEmpty
                  ? null
                  : row.sectionController.text.trim(),
              stepNumber: _steps.indexOf(row) + 1,
              instruction: row.instructionController.text.trim(),
              timerMinutes: int.tryParse(row.timerController.text.trim()),
              sortOrder: _steps.indexOf(row),
            ),
          )
          .toList(),
    );

    if (widget.recipeId == null) {
      await ref.read(recipeRepositoryProvider).addRecipe(recipe);
    } else {
      await ref.read(recipeRepositoryProvider).updateRecipe(recipe);
    }

    if (!mounted) return;
    context.go('/recipes/$id');
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final catalogItems = ref.watch(ingredientsProvider).valueOrNull ?? <IngredientCatalogItem>[];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/recipes'),
        ),
        title: Text(widget.recipeId == null ? 'New recipe' : 'Edit recipe'),
        actions: [
          TextButton(
            onPressed: _saveRecipe,
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveRecipe,
        icon: const Icon(Icons.save_outlined),
        label: const Text('Save recipe'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              validator: (value) =>
                  value == null || value.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _servingsController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(labelText: 'Servings'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _instructionsController,
              minLines: 3,
              maxLines: 5,
              decoration: const InputDecoration(labelText: 'Instructions'),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('Ingredients'),
            ..._ingredients.map((row) => _buildIngredientCard(row, catalogItems)),
            TextButton.icon(
              onPressed: () => setState(() => _ingredients.add(_IngredientRow())),
              icon: const Icon(Icons.add),
              label: const Text('Add ingredient'),
            ),
            const SizedBox(height: 20),
            _buildSectionHeader('Steps'),
            ..._steps.map((row) => _buildStepCard(row)),
            TextButton.icon(
              onPressed: () => setState(() => _steps.add(_StepRow())),
              icon: const Icon(Icons.add),
              label: const Text('Add step'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildIngredientCard(_IngredientRow row, List<IngredientCatalogItem> catalogItems) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Autocomplete<IngredientCatalogItem>(
                    initialValue: TextEditingValue(text: row.nameController.text),
                    optionsBuilder: (textEditingValue) {
                      if (textEditingValue.text.isEmpty) {
                        return catalogItems;
                      }
                      return catalogItems.where(
                        (item) => item.displayName.toLowerCase().contains(
                              textEditingValue.text.toLowerCase(),
                            ),
                      );
                    },
                    displayStringForOption: (option) => option.displayName,
                    onSelected: (option) {
                      row.selectedCatalogIngredient = option;
                      row.ingredientId = option.id;
                      row.nameController.text = option.displayName;
                      if (row.unitController.text.isEmpty && option.defaultUnit != null) {
                        row.unitController.text = option.defaultUnit!;
                      }
                      setState(() {});
                    },
                    fieldViewBuilder: (
                      context,
                      textEditingController,
                      focusNode,
                      onFieldSubmitted,
                    ) {
                      textEditingController.text = row.nameController.text;
                      textEditingController.selection = TextSelection.collapsed(
                        offset: textEditingController.text.length,
                      );
                      return TextFormField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        decoration: const InputDecoration(labelText: 'Ingredient name'),
                        onChanged: (value) {
                          row.selectedCatalogIngredient = null;
                          row.nameController.text = value;
                        },
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => _ingredients.remove(row)),
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            if (row.selectedCatalogIngredient != null) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                children: [
                  if (row.selectedCatalogIngredient!.category?.isNotEmpty == true)
                    Chip(
                      label: Text(row.selectedCatalogIngredient!.category!),
                      visualDensity: VisualDensity.compact,
                    ),
                  if (row.selectedCatalogIngredient!.defaultUnit?.isNotEmpty == true)
                    Chip(
                      label: Text('Unit: ${row.selectedCatalogIngredient!.defaultUnit!}'),
                      visualDensity: VisualDensity.compact,
                    ),
                ],
              ),
            ],
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: row.quantityController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: 'Quantity'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: row.unitController,
                    decoration: const InputDecoration(labelText: 'Unit'),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: row.noteController,
              decoration: const InputDecoration(labelText: 'Note'),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                TextButton.icon(
                  onPressed: () => setState(() => row.substitutes.add(_SubstituteRow())),
                  icon: const Icon(Icons.swap_horiz),
                  label: const Text('Add substitute'),
                ),
              ],
            ),
            ...row.substitutes.map((sub) => _buildSubstituteCard(sub, row)),
          ],
        ),
      ),
    );
  }

  Widget _buildSubstituteCard(_SubstituteRow sub, _IngredientRow row) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: sub.nameController,
                  decoration: const InputDecoration(labelText: 'Substitute ingredient'),
                ),
              ),
              IconButton(
                onPressed: () => setState(() => row.substitutes.remove(sub)),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: sub.quantityController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Quantity'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextFormField(
                  controller: sub.unitController,
                  decoration: const InputDecoration(labelText: 'Unit'),
                ),
              ),
            ],
          ),
          TextFormField(
            controller: sub.noteController,
            decoration: const InputDecoration(labelText: 'Note'),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard(_StepRow row) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: row.sectionController,
                    decoration: const InputDecoration(labelText: 'Section (optional)'),
                  ),
                ),
                IconButton(
                  onPressed: () => setState(() => _steps.remove(row)),
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            TextFormField(
              controller: row.instructionController,
              minLines: 2,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Instruction'),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: row.timerController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Timer minutes (optional)'),
            ),
          ],
        ),
      ),
    );
  }
}

class _IngredientRow {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final List<_SubstituteRow> substitutes = [];
  final domain_ingredient.RecipeIngredient? ingredient;
  IngredientCatalogItem? selectedCatalogIngredient;
  String? ingredientId;

  _IngredientRow({this.ingredient, List<_SubstituteRow>? substitutes}) {
    if (substitutes != null) {
      this.substitutes.addAll(substitutes);
    }
    ingredientId = ingredient?.ingredientId;
  }
}

class _SubstituteRow {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final domain_ingredient.RecipeIngredientSubstitute? substitute;

  _SubstituteRow({this.substitute});
}

class _StepRow {
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController instructionController = TextEditingController();
  final TextEditingController timerController = TextEditingController();
  final domain_step.RecipeStep? step;

  _StepRow({this.step});
}
