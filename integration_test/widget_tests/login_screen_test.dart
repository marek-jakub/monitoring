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

      expect(find.byKey(const ValueKey('monitoringLogo')), findsOneWidget);
      tester.printToConsole('Found monitoring logo.');
      expect(find.byKey(const ValueKey('username')), findsOneWidget);
      tester.printToConsole('Found username form field.');
      expect(find.byKey(const ValueKey('password')), findsOneWidget);
      tester.printToConsole('Found password form field.');
      expect(find.byKey(const ValueKey('entryButton')), findsOneWidget);
      tester.printToConsole('Found entry button.');

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
