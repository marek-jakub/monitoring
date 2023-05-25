import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../screens/screens.dart';

/// Home screen serving as a container for screens.
class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: MonitoRingPages.home,
      key: ValueKey(MonitoRingPages.home),
      child: Home(
        currentTab: currentTab,
      ),
    );
  }

  const Home({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Holds pages for the main screen movement.
  static List<Widget> pages = <Widget>[
    // const SessionsScreen(),
    // const RetrapsScreen(),
    // const SearchScreen(),
    // const MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // TODO: build home screen body
        );
  }
}
