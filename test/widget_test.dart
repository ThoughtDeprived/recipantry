import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipantry/features/recipes/domain/models/recipe.dart' as domain;
import 'package:recipantry/features/recipes/presentation/providers/recipes_provider.dart';
import 'package:recipantry/features/recipes/presentation/screens/recipes_list_screen.dart';

void main() {
  testWidgets('recipes screen shows empty state and seed action', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          recipesProvider.overrideWith(
            (ref) => Stream<List<domain.Recipe>>.value(const []),
          ),
        ],
        child: const MaterialApp(home: RecipesListScreen()),
      ),
    );
    await tester.pump();

    expect(find.text('No recipes yet'), findsOneWidget);
    expect(find.text('Seed sample recipes'), findsWidgets);
  });
}
