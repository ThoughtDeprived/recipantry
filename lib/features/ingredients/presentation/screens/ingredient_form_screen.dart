import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../domain/models/ingredient_catalog.dart';
import '../providers/ingredients_provider.dart';

class IngredientFormScreen extends ConsumerStatefulWidget {
  final String? ingredientId;

  const IngredientFormScreen({super.key, this.ingredientId});

  @override
  ConsumerState<IngredientFormScreen> createState() => _IngredientFormScreenState();
}

class _IngredientFormScreenState extends ConsumerState<IngredientFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _defaultUnitController = TextEditingController();
  final _categoryController = TextEditingController();
  final _aliasesController = TextEditingController();
  IngredientCatalogItem? _existingIngredient;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadIngredient());
  }

  Future<void> _loadIngredient() async {
    if (widget.ingredientId == null) {
      setState(() => _loading = false);
      return;
    }

    final ingredient = await ref.read(ingredientRepositoryProvider).getIngredient(widget.ingredientId!);
    if (!mounted) return;
    if (ingredient != null) {
      _existingIngredient = ingredient;
      _displayNameController.text = ingredient.displayName;
      _defaultUnitController.text = ingredient.defaultUnit ?? '';
      _categoryController.text = ingredient.category ?? '';
      _aliasesController.text = ingredient.aliases ?? '';
    }
    setState(() => _loading = false);
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _defaultUnitController.dispose();
    _categoryController.dispose();
    _aliasesController.dispose();
    super.dispose();
  }

  String _autoKey(String displayName) {
    final trimmed = displayName.trim().toLowerCase();
    return trimmed.replaceAll(RegExp(r'\s+'), '_');
  }

  Future<void> _saveIngredient() async {
    if (!_formKey.currentState!.validate()) return;

    final now = DateTime.now();
    final ingredient = IngredientCatalogItem(
      id: widget.ingredientId ?? const Uuid().v4(),
      ingredientKey: _autoKey(_displayNameController.text),
      displayName: _displayNameController.text.trim(),
      defaultUnit: _defaultUnitController.text.trim().isEmpty ? null : _defaultUnitController.text.trim(),
      category: _categoryController.text.trim().isEmpty ? null : _categoryController.text.trim(),
      aliases: _aliasesController.text.trim().isEmpty ? null : _aliasesController.text.trim(),
      isSystem: _existingIngredient?.isSystem ?? false,
      createdByUser: _existingIngredient?.createdByUser,
      defaultStorageSpaceId: _existingIngredient?.defaultStorageSpaceId,
      isFood: _existingIngredient?.isFood ?? true,
      createdAt: _existingIngredient?.createdAt ?? now,
      updatedAt: now,
    );

    if (widget.ingredientId == null) {
      await ref.read(ingredientRepositoryProvider).addIngredient(ingredient);
    } else {
      await ref.read(ingredientRepositoryProvider).updateIngredient(ingredient);
    }

    if (!mounted) return;
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ingredientId == null ? 'New ingredient' : 'Edit ingredient'),
        actions: [
          TextButton(
            onPressed: _saveIngredient,
            child: const Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _displayNameController,
              decoration: const InputDecoration(labelText: 'Display name'),
              validator: (value) => value == null || value.trim().isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _defaultUnitController,
              decoration: const InputDecoration(labelText: 'Default unit (optional)'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _categoryController,
              decoration: const InputDecoration(labelText: 'Category (optional)'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _aliasesController,
              minLines: 2,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Aliases (optional)'),
            ),
          ],
        ),
      ),
    );
  }
}
