import 'package:flutter/material.dart';
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
                    return Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            if (_selectedId > -1) {
                              dataManager.getSessionLocationById(_selectedId);
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
                          child: SizedBox(
                            height: 150.0,
                            child: ListView.builder(
                              itemCount: sessions.length,
                              itemBuilder: (context, index) {
                                final session = sessions[index];
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_selectedId == session.id) {
                                        _selectedId = -1;
                                        dataManager.setCurrentSessionId(-1);
                                        dataManager.setCurrentLocationId(-1);
                                        dataManager.setSessionTapped(false);
                                        dataManager.setCountry('');
                                      } else {
                                        _selectedId = session.id;
                                        dataManager
                                            .setCurrentSessionId(session.id);
                                        dataManager.setCountry(
                                            session.locationCountry ?? '');
                                        dataManager.setCurrentLocationId(
                                            session.location);
                                        dataManager
                                            .getSessionRingStream(session.id);
                                        dataManager
                                            .getSessionRetrapStream(session.id);
                                        dataManager.setSessionTapped(true);
                                      }
                                    });
                                  },
                                  child: Card(
                                    key: ValueKey(session.id),
                                    elevation: 0,
                                    child: Container(
                                      decoration: session.id == _selectedId
                                          ? const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                                left: BorderSide(
                                                    color: Colors.black),
                                                right: BorderSide(
                                                    color: Colors.black),
                                                bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 2,
                                                ),
                                              ),
                                            )
                                          : const BoxDecoration(
                                              // border: Border(
                                              //   top: BorderSide(
                                              //       color: Colors.white,
                                              //       width: 2),
                                              //   left: BorderSide(
                                              //       color: Colors.white),
                                              //   right: BorderSide(
                                              //       color: Colors.white),
                                              //   bottom: BorderSide(
                                              //       color: Colors.white,
                                              //       width: 2),
                                              // ),
                                              ),
                                      // color: session.id == _selectedId
                                      //     ? Colors.amber
                                      //     : Colors.blueGrey[300],
                                      child: Row(
                                        children: [
                                          Text('${session.date} - '),
                                          Text(session.locationLocality ?? ''),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
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
