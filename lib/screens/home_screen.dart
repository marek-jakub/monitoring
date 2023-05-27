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

  /// The current screen tab.
  final int currentTab;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// Holds pages for the main screen movement.
  static List<Widget> pages = <Widget>[
    const SessionsScreen(),
    const RetrapsScreen(),
    const SearchScreen(),
    const MapScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MonitoRing',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
        actions: [
          profileButton(),
        ],
      ),
      body: IndexedStack(
        index: widget.currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: widget.currentTab,
        onTap: (value) {
          Provider.of<MonitoRingStateManager>(context, listen: false)
              .goToTab(value);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.inventory,
                color: Colors.brown,
              ),
              activeIcon: Icon(
                Icons.inventory,
                color: Colors.amber,
              ),
              label: 'Sessions'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.join_left_sharp,
                color: Colors.brown,
              ),
              activeIcon: Icon(Icons.join_left_sharp, color: Colors.amber),
              label: 'Retraps'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.brown,
              ),
              activeIcon: Icon(
                Icons.search,
                color: Colors.amber,
              ),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                color: Colors.brown,
              ),
              activeIcon: Icon(
                Icons.map,
                color: Colors.amber,
              ),
              label: 'Maps'),
        ],
      ),
    );
  }

  /// A button for ringer profile access.
  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
          Provider.of<ProfileManager>(context, listen: false)
              .tapOnProfile(true);
        },
      ),
    );
  }
}
