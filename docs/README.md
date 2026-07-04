# Recipantry Data and Asset Documentation

## Built-in Ingredient Catalog

This app ships a built-in ingredient catalog as asset data rather than hardcoded Dart seed values.

- Asset file: `assets/data/ingredients.json`
- Loaded on app startup through `DriftIngredientRepository.initializeCatalog()`
- Only imports data when the `IngredientCatalog` table is empty
- Keeps the catalog as app-owned master data, not embedded in Dart code

## IngredientCatalog Schema

The `IngredientCatalog` table now includes:

- `id`: primary key
- `ingredientKey`: canonical lookup key
- `displayName`: visible label
- `defaultUnit`: optional default quantity unit
- `category`: optional grouping label
- `aliases`: optional lookup aliases
- `isSystem`: whether this catalog entry is built-in
- `createdByUser`: nullable user-generated owner context
- `createdAt`: timestamp when entry was created
- `updatedAt`: timestamp of last update

## Recipe Ingredients

Recipe ingredient rows now store a reference to the ingredient catalog item:

- `RecipeIngredient.ingredientId` is optional and links to `IngredientCatalog.id`
- `ingredientKey` is still preserved for display and matching
- This design allows existing recipes to keep ingredient names while supporting catalog lookups

## Theme and UI

The app theme now uses an accessible green palette centered on:

- primary: `#2F6F4E`
- secondary: `#1F4D36`

## Notes for Developers

- If you add more built-in master data, update `assets/data/ingredients.json`
- Any new ingredient catalog assets should be added to `pubspec.yaml`
- To update the database schema, run `flutter pub run build_runner build --delete-conflicting-outputs`
