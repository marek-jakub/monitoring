import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

/// Application login screen.
///
/// ...
class LoginScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.loginPath,
      key: ValueKey(MonitoRingPages.loginPath),
      child: const LoginScreen(),
    );
  }

  /// Holds ringer username.
  final String? username;

  const LoginScreen({
    super.key,
    this.username,
  });

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
              const SizedBox(
                height: 200,
                child: Image(
                  key: ValueKey('monitoringLogo'),
                  image: AssetImage('assets/images/mon_ring_logo.png'),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              entryTextfield(
                  key: const ValueKey('username'), username ?? 'username'),
              const SizedBox(
                height: 16.0,
              ),
              entryTextfield(key: const ValueKey('password'), 'password'),
              const SizedBox(
                height: 16.0,
              ),
              entryButton(context),
              guestButton(context),
            ],
          ),
        ),
      ),
    );
  }

  /// A textfield for entering username.
  Widget entryTextfield(String aHint, {required ValueKey<String> key}) {
    return TextField(
      key: key,
      cursorColor: ringsColor,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 1.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
        hintText: aHint,
        hintStyle: const TextStyle(height: 0.5),
      ),
    );
  }

  /// A button to log in the application.
  Widget entryButton(BuildContext context) {
    return SizedBox(
      height: 45,
      child: MaterialButton(
        key: const ValueKey('entryButton'),
        color: ringsColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          // Provider.of<MonitoRingStateManager>(context, listen: false)
          //     .login('mockUsername', 'mockPassword');
        },
      ),
    );
  }

  /// A button to log in the application as a guest.
  Widget guestButton(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextButton(
        key: const ValueKey('guestButton'),
        child: const Text(
          'Explore as Guest',
        ),
        onPressed: () async {
          Provider.of<MonitoRingStateManager>(context, listen: false)
              .login('guestUsername', 'guestPassword');
        },
      ),
    );
  }
}
