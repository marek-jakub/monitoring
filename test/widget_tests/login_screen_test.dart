import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monitoring/screens/login_screen.dart';

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

void main() {
  testWidgets(
      'Login screen has a logo, form fields for username, password and login button.',
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: LoginScreen()));
    await widgetTester.pumpAndSettle();

    expect(find.byKey(const ValueKey('monitoringLogo')), findsOneWidget);
    expect(find.byKey(const ValueKey('username')), findsOneWidget);
    expect(find.byKey(const ValueKey('password')), findsOneWidget);
    expect(find.byKey(const ValueKey('entryButton')), findsOneWidget);
  });
}
