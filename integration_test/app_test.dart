import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/screens/home_screen.dart';
import 'package:flutter_project/screens/search_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_project/main.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  group('Home screen', () {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home: HomeScreen())
    );
    testWidgets('Test tap search button', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.tap(find.byKey(Key('search_button')));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 3));
    });
  });

  group('Search screen', () {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home: SearchScreen())
    );
    testWidgets('Test search movie', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.enterText(find.byKey(Key('search_bar')), 'one piece');
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 4));
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 6));
    });
  });

  group('Home screen', () {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home: HomeScreen())
    );
    testWidgets('Test tap watchlist', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.tap(find.byKey(Key('account_button')));
      await Future.delayed(Duration(seconds: 2));
      await tester.pumpAndSettle();

      Finder watchlist = find.text('Watchlist');
      expect(watchlist, findsOneWidget);
      await tester.tap(watchlist);
      await Future.delayed(Duration(seconds: 4));

    });
  });

  group('Home screen', () {
    Widget testWidget = const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(home: HomeScreen())
    );
    testWidgets('Test tap sign up, login', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.tap(find.byKey(Key('account_button')));
      await Future.delayed(Duration(seconds: 3));
      await tester.pumpAndSettle();

      Finder signup = find.text('Sign Up');
      expect(signup, findsOneWidget);
      await tester.tap(signup);
      await Future.delayed(Duration(seconds: 3));
      await tester.pumpAndSettle();

      Finder login = find.text('Log in');
      expect(login, findsOneWidget);
      await tester.tap(login);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 3));

      await tester.tap(find.byKey(Key('clear_icon')));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 3));
    });
  });
}