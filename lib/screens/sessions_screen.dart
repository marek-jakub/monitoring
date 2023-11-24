import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/monitoring_db.dart';
import '../models/models.dart';
import '../widgets/custom_widgets.dart';

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
  // Session dropdown field controller
  final TextEditingController _ringerSession = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _ringerSession.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RingDataManager>(
      builder: (context, dataManager, child) {
        dataManager.getRingerSessionsLocations(
            Provider.of<ProfileManager>(context, listen: false)
                .getRinger
                .ringerId);
        return Scaffold(
          persistentFooterButtons: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  key: const ValueKey('sessionButton'),
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
                    if (_ringerSession.text != '') {
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
                      // TODO: implement session location stream for a given ringer
                      //notifier.sessionLocationViewStream,
                      notifier.ringerSessions,
                  shouldRebuild: (previous, next) => true,
                  builder: (context, sessions, child) {
                    return Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            if (_ringerSession.text != '') {
                              int sessionId = int.tryParse(
                                      _ringerSession.text.split(',').first) ??
                                  -1;
                              dataManager.getSessionLocationById(sessionId);
                              dataManager.setEditSession(true);
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
                        ),
                        Expanded(
                          child: CustomDropdownSessionField(
                            sessionController: _ringerSession,
                            txtLabel: 'Ringing sessions',
                            sessionData: sessions,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const Text('Session rings'),
                Expanded(
                  child: dataManager.sessionTapped
                      ? dataManager.sessionRingStream.isNotEmpty
                          ? Selector<RingDataManager, List<RingEntityData>>(
                              selector: (context, notifier) =>
                                  notifier.sessionRingStream,
                              builder: (context, rings, child) {
                                return ListView.builder(
                                  itemCount: rings.length,
                                  itemBuilder: (context, index) {
                                    final ring = rings[index];
                                    return GestureDetector(
                                      onTap: () {
                                        dataManager.getRingById(ring.id);
                                        dataManager.setEditRing(true);
                                        dataManager.setSelectedRingId(ring.id);
                                      },
                                      child: Card(
                                        elevation: 0,
                                        child: Column(
                                          children: [
                                            // TODO: refactor the code, create a ring card
                                            // Text(ring.id.toString()),
                                            Row(
                                              children: [
                                                const Expanded(
                                                  child: Text(
                                                      'Primary ID method:',
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      ring.primaryIdMethod,
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                  child: Text('Metal ring:',
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      ring.metalRingInfo,
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                  child: Text('Ring series:',
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                      ring.ringSeriesCode,
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                  child: Text('ID number:',
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                                Expanded(
                                                  child: Text(ring.ringIdNumber,
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                  child: Text('Species:',
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                                Expanded(
                                                  child: Text(ring.species,
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                  child: Text('Sex:',
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                                Expanded(
                                                  child: Text(ring.sex,
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Expanded(
                                                  child: Text('Age:',
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                                Expanded(
                                                  child: Text(ring.age,
                                                      textAlign:
                                                          TextAlign.left),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          : const Center(
                              child: Text('Session does not contain rings'),
                            )
                      : const Center(
                          child: Text('Session not selected'),
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
