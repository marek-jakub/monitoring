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
        title: const Text('MonitoRing sign in'),
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
            pageIndicator(),
            pageActionButtons(),
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
        onboardPage(
          const AssetImage('assets/images/onboarding_1.png'),
          '''Easy acces to ringing data!''',
        ),
        onboardPage(
          const AssetImage('assets/images/onboarding_2.png'),
          '''Offline data input and editing!''',
        ),
        onboardPage(
          const AssetImage('assets/images/onboarding_3.png'),
          '''EURING Code compatible!''',
        ),
      ],
    );
  }

  /// An imgage with description.
  ///
  /// A provider [imageProvider] loading an asset image.
  /// A string [description] providing an onboarding message.
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

  /// Page indicator effect.
  Widget pageIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(activeDotColor: messageColor),
    );
  }

  /// A button for skipping onboarding.
  Widget pageActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
            child: const Text('Skip'),
            onPressed: () {
              Provider.of<MonitoRingStateManager>(context, listen: false)
                  .completeOnboarding();
            })
      ],
    );
  }
}
