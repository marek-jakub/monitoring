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
              const Text('Retraps'),
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
                                      // set selected retrap id
                                      // call get selected retrap by id
                                      // call set edit retrap to true
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
                                          // TODO: adjust what retrap attributes
                                          // to be shown.
                                          Text(retrap.id.toString()),
                                          Text(retrap.ringIdNumber),
                                          Text(retrap.ringScheme),
                                          Text(retrap.condition),
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
