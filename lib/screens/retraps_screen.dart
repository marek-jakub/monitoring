import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/monitoring_db.dart';
import '../models/models.dart';

class RetrapsScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: MonitoRingPages.retrapsPath,
      key: ValueKey(MonitoRingPages.retrapsPath),
      child: const RetrapsScreen(),
    );
  }

  const RetrapsScreen({super.key});

  @override
  State<RetrapsScreen> createState() => _RetrapsScreenState();
}

class _RetrapsScreenState extends State<RetrapsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RingDataManager>(builder: (context, dataManager, child) {
      return Scaffold(
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (dataManager.currentSessionId > -1) {
                    dataManager.setNewRetrap(true);
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
                style: ElevatedButton.styleFrom(fixedSize: const Size(90, 25)),
                child: const Text('Retrap'),
              ),
            ],
          ),
        ],
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Session retraps'),
              Expanded(
                child: dataManager.sessionTapped
                    ? dataManager.sessionRetrapStream.isNotEmpty
                        ? Selector<RingDataManager, List<RetrapEntityData>>(
                            selector: (context, notifier) =>
                                notifier.sessionRetrapStream,
                            builder: (context, retraps, child) {
                              return ListView.builder(
                                itemCount: retraps.length,
                                itemBuilder: (context, index) {
                                  final retrap = retraps[index];
                                  return GestureDetector(
                                    onTap: () {
                                      dataManager.getRetrapById(retrap.id);
                                      dataManager
                                          .setSelectedRetrapId(retrap.id);
                                      dataManager.setEditRetrap(true);
                                    },
                                    child: Card(
                                      color: Colors.blueGrey.shade100,
                                      shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Colors.green,
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      child: Column(
                                        children: [
                                          // TODO: refactor the code, create retrap card
                                          //Text(retrap.id.toString()),
                                          Row(
                                            children: [
                                              const Expanded(
                                                child: Text('Ring series:',
                                                    textAlign: TextAlign.left),
                                              ),
                                              Expanded(
                                                child: Text(
                                                    retrap.ringSeriesCode,
                                                    textAlign: TextAlign.left),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Expanded(
                                                child: Text('Ringing scheme:',
                                                    textAlign: TextAlign.left),
                                              ),
                                              Expanded(
                                                child: Text(retrap.ringScheme,
                                                    textAlign: TextAlign.left),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Expanded(
                                                child: Text('ID number:',
                                                    textAlign: TextAlign.left),
                                              ),
                                              Expanded(
                                                child: Text(retrap.ringIdNumber,
                                                    textAlign: TextAlign.left),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Expanded(
                                                child: Text('Condition:',
                                                    textAlign: TextAlign.left),
                                              ),
                                              Expanded(
                                                child: Text(retrap.condition,
                                                    textAlign: TextAlign.left),
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
                            child: Text('Session does not contain retraps!'),
                          )
                    : const Center(
                        child: Text('Session is not selected.'),
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
