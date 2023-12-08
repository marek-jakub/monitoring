import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

/// Application splash screen.
class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.splashPath,
      key: ValueKey(MonitoRingPages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<MonitoRingStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 200,
              image: AssetImage('assets/images/mon_ring_logo.png'),
            ),
            Text('Initializing...'),
          ],
        ),
      ),
    );
  }
}
