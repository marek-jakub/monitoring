import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monitoring/main.dart';

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

void main() {
  group('Enter profile screen and log out.', () {
    // Testing should start from logged out state.
    // If logged in, it jumps to home screen directly and
    // log in throws assertion error, in this case run this log out test
    // first.
    testWidgets(
        'If already logged in, run this to log out. If logged out, this test will fail, which is normal.',
        (tester) async {
      await tester.pumpWidget(const MonitoRing());
      await addDelay(4000);
      await tester.pumpAndSettle();
      // Enter profile screen and logout
      await tester.tap(find.byKey(const ValueKey('profileButton')));
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Settings screen opens');
      await tester.tap(find.byKey(const ValueKey('logoutTile')));
      await tester.pumpAndSettle();
      tester.printToConsole('Logged out succesfully');
    });
  });

  group('Open the app, from splash screen to login, home page', () {
    // Testing should start from logged out state.
    // If logged in, it jumps to home screen directly and
    // log in throws assertion error, in this case run log out 'log out' test
    // first.
    testWidgets('If logged out, log in.', (tester) async {
      await tester.pumpWidget(const MonitoRing());
      await addDelay(4000);
      await tester.pumpAndSettle();
      tester.printToConsole('Login screen opens');
      await tester.tap(find.byKey(const ValueKey('entryButton')));
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Onboarding screen opens');
      await tester.tap(find.byKey(const ValueKey('skipButton')));
      await addDelay(2000);
      await tester.pumpAndSettle();

      tester.printToConsole('At the home screen.');
      await addDelay(2000);
      await tester.pumpAndSettle();

      tester.printToConsole(
          'Home screen should have appBar, title and profile button');
      expect(find.byKey(const ValueKey('appBar')), findsOneWidget);
      tester.printToConsole('Found app bar.');
      expect(find.byKey(const ValueKey('appBarTitle')), findsOneWidget);
      tester.printToConsole('Found app bar title');
      expect(find.byKey(const ValueKey('indexedStack')), findsOneWidget);
      tester.printToConsole('Found indexed stack.');
      expect(find.byKey(const ValueKey('profileButton')), findsOneWidget);
      tester.printToConsole('Found profile button.');

      // Enter profile screen and logout
      await tester.tap(find.byKey(const ValueKey('profileButton')));
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Settings screen opens');
      await tester.tap(find.byKey(const ValueKey('logoutTile')));
      await tester.pumpAndSettle();
      tester.printToConsole('Logged out succesfully');
    });
  });
}
