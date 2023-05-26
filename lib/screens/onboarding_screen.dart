import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/models.dart';

/// Screen for onboarding messages after first log in.
class OnboardingScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.onboardingPath,
      key: ValueKey(MonitoRingPages.onboardingPath),
      child: const OnboardingScreen(),
    );
  }

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  /// Controller for onboarding pages.
  final controller = PageController();

  /// Page indicator color.
  final Color messageColor = const Color.fromRGBO(46, 134, 77, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('MonitoRing'),
        leading: GestureDetector(
          child: const Icon(
            Icons.chevron_left,
            size: 30,
          ),
          onTap: () {
            Navigator.pop(context, true);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: onboardingPages()),
          ],
        ),
      ),
    );
  }

  /// A page view serving onboarding image messages.
  Widget onboardingPages() {
    return PageView(
      controller: controller,
      children: [
        // TODO: Add onboarding pages
        //onboardPage(),
      ],
    );
  }

  /// An imgage with description.
  ///
  /// @param imageProvider A provider loading an asset image.
  /// @param description A string providing an onboarding message.
  Widget onboardPage(ImageProvider imageProvider, String description) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              fit: BoxFit.fitWidth,
              image: imageProvider,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
