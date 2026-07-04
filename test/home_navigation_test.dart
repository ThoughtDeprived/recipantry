import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recipantry/features/home/presentation/screens/home_screen.dart';

void main() {
  testWidgets('home screen shows dashboard cards', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    await tester.pump();

    expect(find.text('Recipes'), findsOneWidget);
    expect(find.text('Ingredients'), findsOneWidget);
    expect(find.text('Grocery / To-Buy List'), findsOneWidget);
    expect(find.text('Pantry / At Home'), findsOneWidget);
  });
}
