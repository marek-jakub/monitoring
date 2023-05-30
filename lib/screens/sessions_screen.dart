import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import '../data/monitoring_db.dart';
import '../models/models.dart';

/// Screen holding information about ringing sessions.
class SessionsScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.sessionsPath,
      key: ValueKey(MonitoRingPages.sessionsPath),
      child: const SessionsScreen(),
    );
  }

  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  /// Holds id of selected session.
  int _selectedId = -1;

  @override
  Widget build(BuildContext context) {
    return Consumer<RingDataManager>(
      builder: (context, dataManager, child) {
        return Scaffold(
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Go to add_session_screen.
                    dataManager.setNewSession(true);
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(90, 25)),
                  child: const Text('Session'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_selectedId > -1) {
                      // Go to add_ring screen.
                      dataManager.setNewRing(true);
                    } else {
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          content: const Text(
                            'Session not selected',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.brown,
                          actions: [
                            TextButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentMaterialBanner();
                              },
                              child: const Text(
                                'Close',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(90, 25)),
                  child: const Text('Ring'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Go to report_screen.
                    dataManager.setNewReport(true);
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(90, 25)),
                  child: const Text('Report'),
                ),
              ],
            ),
          ],
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('Ringing sessions'),
                Selector<RingDataManager, List<SessionLocationViewData>>(
                  selector: (context, notifier) =>
                      notifier.sessionLocationViewStream,
                  shouldRebuild: (previous, next) => true,
                  builder: (context, sessions, child) {
                    return Row();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
