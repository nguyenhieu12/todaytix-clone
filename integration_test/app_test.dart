import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_project/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final Finder searchButton = find.byKey(Key('search_button'));

  testWidgets('Hi',
      (WidgetTester tester) async {
        app.main();

        await tester.pumpAndSettle();
        await tester.tap(searchButton);
        await Future.delayed(Duration(seconds: 3));

        await tester.pumpAndSettle();

      }
  );
}