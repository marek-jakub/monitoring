import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

/// A screen holding ringer profile information.
///
/// Offers access to add ring series, lost rings and make orders screens.
class ProfileScreen extends StatefulWidget {
  static MaterialPage page(Ringer ringer) {
    return MaterialPage(
      name: MonitoRingPages.profilePath,
      key: ValueKey(MonitoRingPages.profilePath),
      child: ProfileScreen(ringer: ringer),
    );
  }

  /// Holds ringer information.
  final Ringer ringer;

  const ProfileScreen({
    Key? key,
    required this.ringer,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MonitoRing - ringer profile'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            buildProfile(),
            Expanded(
              child: buildMenu(),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<RingDataManager>(context, listen: false)
                    .setNewRingSeries(true);
              },
              child: const Text('Add ring series'),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<RingDataManager>(context, listen: false)
                    .setNewLostRing(true);
              },
              child: const Text('Add lost ring'),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<RingDataManager>(context, listen: false)
                    .setMakeOrder(true);
              },
              child: const Text('Order rings'),
            ),
          ],
        ),
      ),
    );
  }

  /// A text giving ringer information.
  Widget buildProfile() {
    return Column(
      children: [
        Text(
          widget.ringer.ringerId,
          style: const TextStyle(fontSize: 21),
        ),
      ],
    );
  }

  /// A listview holding profile menu.
  ///
  /// Access to dar mode, EURING code and logout.
  Widget buildMenu() {
    return ListView(
      children: [
        showDarkModeRow(),
        ListTile(
          title: const Text('View Euring Code 2020'),
          onTap: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnEuringCode(true);
          },
        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
            Provider.of<MonitoRingStateManager>(context, listen: false)
                .logout();
          },
        ),
      ],
    );
  }

  /// A dark mode switch.
  Widget showDarkModeRow() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Dark mode'),
          Switch(
              value: widget.ringer.darkMode,
              onChanged: (value) {
                Provider.of<ProfileManager>(context, listen: false).darkMode =
                    value;
              })
        ],
      ),
    );
  }
}
