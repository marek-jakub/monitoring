import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

/// Application login screen.
///
///
class LoginScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.loginPath,
      key: ValueKey(MonitoRingPages.loginPath),
      child: const LoginScreen(),
    );
  }

  /// Holds ringer ID.
  final String? username;

  const LoginScreen({
    Key? key,
    this.username,
  }) : super(key: key);

  final Color ringsColor = const Color.fromRGBO(46, 134, 77, 1);
  final TextStyle onFocusStyle = const TextStyle(color: Colors.green);
  final TextStyle nonFocusStyle = const TextStyle(color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TODO: create sign in GUI
            ],
          ),
        ),
      ),
    );
  }
}
