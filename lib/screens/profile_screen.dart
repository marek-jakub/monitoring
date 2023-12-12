import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

/// A screen holding ringer profile information.
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
    super.key,
    required this.ringer,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MonitoRing: profile'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<ProfileManager>(context, listen: false)
                .tapOnProfile(false);
          },
        ),
      ),
      body: Column(
        children: [
          buildProfile(),
          buildMenu(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    Provider.of<RingDataManager>(context, listen: false)
                        .getRingSeriesStream(
                            Provider.of<ProfileManager>(context, listen: false)
                                .getRinger
                                .ringerId);
                    Provider.of<RingDataManager>(context, listen: false)
                        .setNewRingSeries(true);
                  },
                  child: const Text('Add ring series'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    Provider.of<RingDataManager>(context, listen: false)
                        .getLostRingsStream(
                            Provider.of<ProfileManager>(context, listen: false)
                                .getRinger
                                .ringerId);
                    Provider.of<RingDataManager>(context, listen: false)
                        .setNewLostRing(true);
                    Provider.of<RingDataManager>(context, listen: false)
                        .getRingSeriesList(
                            Provider.of<ProfileManager>(context, listen: false)
                                .getRinger
                                .ringerId);
                  },
                  child: const Text('Add lost ring'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    Provider.of<RingDataManager>(context, listen: false)
                        .getOrderStream(
                            Provider.of<ProfileManager>(context, listen: false)
                                .getRinger
                                .ringerId);
                    Provider.of<RingDataManager>(context, listen: false)
                        .setMakeOrder(true);
                  },
                  child: const Text('Order rings'),
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 200.0,
          // ),
        ],
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
    return Column(
      children: [
        showDarkModeRow(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: const Text('View Euring Code 2020'),
            onTap: () {
              Provider.of<ProfileManager>(context, listen: false)
                  .tapOnEuringCode(true);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            key: const ValueKey('logoutTile'),
            title: const Text('Logout'),
            onTap: () {
              Provider.of<ProfileManager>(context, listen: false)
                  .tapOnProfile(false);
              Provider.of<MonitoRingStateManager>(context, listen: false)
                  .logout();
            },
          ),
        ),
      ],
    );
  }

  /// A dark mode switch.
  Widget showDarkModeRow() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Dark mode'),
          ),
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
