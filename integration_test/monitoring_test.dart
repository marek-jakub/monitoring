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
    testWidgets('If already logged in, run this to log out.', (tester) async {
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

  group('Open the app, from splash screen to login, home page and add session.',
      () {
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

      // Enter session screen
      await tester.tap(find.byKey(const ValueKey('sessionButton')));
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Add session screen opens');
      // Set a country
      await tester.tap(find.byKey(const ValueKey('country')));
      await tester.pumpAndSettle();
      await addDelay(2000);
      await tester.fling(find.byType(ListView), const Offset(0, -1900), 17000);
      await addDelay(2000);
      await tester.pumpAndSettle();
      await tester.tap(find.text('UNITED KINGDOM'));
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Added country.');
      // Set a place code
      await tester.tap(find.byKey(const ValueKey('place_code')));
      await addDelay(2000);
      await tester.pumpAndSettle();
      await tester.tap(find.text('GBMB'));
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Added place code.');
      // Set a locality name
      await tester.enterText(
          find.byKey(const ValueKey('locality')), 'Green meadow');
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Added locality.');
      // Set date
      await tester.enterText(
          find.byKey(const ValueKey('date_picker')), '10-10-2023');
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Added date.');
      // Set accuracy of date
      await tester.tap(find.byKey(const ValueKey('date_accuracy')));
      await addDelay(2000);
      await tester.pumpAndSettle();
      await tester.tap(find.text('0'));
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Added accuracy of date.');
      // Set latitude
      await tester.enterText(find.byKey(const ValueKey('latitude')), '0.1234');
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Added latitude.');
      // Set longitude
      await tester.enterText(
          find.byKey(const ValueKey('longitude')), '48.1234');
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Added latitude.');
      // Set accuracy of co-ordinates
      await tester.tap(find.byKey(const ValueKey('coordinates_accuracy')));
      await addDelay(2000);
      await tester.pumpAndSettle();
      await tester.tap(find.text('1'));
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Added co-ordinates accuracy.');
      // Set start time
      await tester.enterText(find.byKey(const ValueKey('start_time')), '04:00');
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Added start time.');
      // Set end time
      await tester.enterText(find.byKey(const ValueKey('end_time')), '10:00');
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Added end time.');
      // Save the session
      final saveIconButton = find.byIcon(Icons.save);
      await tester.tap(saveIconButton);
      await addDelay(2000);
      await tester.pumpAndSettle();
      final messengerText = find.text('Session data saved');
      expect(messengerText, findsOneWidget);
      final okButtonFinder = find.widgetWithText(TextButton, 'Close');
      await tester.tap(okButtonFinder);
      await addDelay(2000);
      await tester.pumpAndSettle();
      tester.printToConsole('Session saved.');
      // Press back button
      await tester.tap(find.byKey(const ValueKey('backButton')));
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
