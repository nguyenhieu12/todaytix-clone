import 'package:flutter/material.dart';
import 'package:flutter_project/screens/search_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_project/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final Finder searchButton = find.byKey(Key('search_button'));
  final Finder searchBar = find.byKey(Key('search_bar'));
  final Finder accountButton = find.byKey(Key('account_button'));

  testWidgets('Test widgets',
      (WidgetTester tester) async {
        app.main();

        // tap search button
        await tester.pumpAndSettle();
        await tester.tap(accountButton);
        await Future.delayed(Duration(seconds: 2));

        // enter blabla -> no result
        // await tester.pumpAndSettle();
        // await tester.tap(searchBar);
        // await tester.enterText(find.byType(TextField), 'jj');
        // await Future.delayed(Duration(seconds: 2));
        // await tester.enterText(find.byType(TextField), 'c');
        // await tester.testTextInput.receiveAction(TextInputAction.done);
        // await tester.tap(accountButton);
        //
        // // enter valid character -> show list result
        // await tester.pumpAndSettle();

        // tap account button
        // await tester.pump(Duration(seconds: 1));
        // await tester.tap(accountButton);
        // await Future.delayed(Duration(seconds: 3));
        //
        // await tester.pump(Duration(seconds: 1));
      }
  );
}